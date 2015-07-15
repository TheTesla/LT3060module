/*
 * LT3060boardTESTprogram.cpp
 *
 * Created: 31.05.2015 22:51:19
 *  Author: Admin
 */ 


#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>

uint16_t leds;
uint8_t led_row;
uint32_t x;

uint16_t leds_tmp, leds_capi, leds_capo, leds_zi, leds_zo, leds_zio, leds_zg, leds_v, leds_brd, leds_brd_su, leds_oc;

uint8_t ADC2LED(int16_t adc)
{
	uint8_t tol = 6;
	if((96 - tol) < adc) return (1 << 5); // 97 - 5.0 V
	if((63 - tol) < adc) return (1 << 4); // 64 - 3.3 V
	if((47 - tol) < adc) return (1 << 3); // 48 - 2.5 V
	if((34 - tol) < adc) return (1 << 2); // 35 - 1.8 V
	if((28 - tol) < adc) return (1 << 1); // 29 - 1.5 V
	if((23 - tol) < adc) return (1 << 0); // 23 - 1.2 V
	return 0;
}


ISR (TIMER0_OVF_vect)
{
	


	
	
	// display
	uint8_t mask = 0;
	
	if(1 == led_row >> 6){
		// line 0
		if(leds & (1 << 13)){
			mask |= (1 << 1);
		}
		if(leds & (1 << 9)){
			mask |= (1 << 2);
		}
		if(leds & (1 << 10)){
			mask |= (1 << 6);
		}
		if(leds & (1 << 11)){
			mask |= (1 << 7);
		}
		PORTB = mask;
		DDRB = 1 | mask;
	} else if (2 == led_row >> 6){
		// line 1
		if(leds & (1 << 0)){
			mask |= (1 << 0);
		}
		if(leds & (1 << 14)){
			mask |= (1 << 2);
		}
		if(leds & (1 << 2)){
			mask |= (1 << 6);
		}
		if(leds & (1 << 1)){
			mask |= (1 << 7);
		}
		PORTB = mask;
		DDRB = 2 | mask;  
	}else if (3 == led_row >> 6){
		// line 2
		if(leds & (1 << 3)){
			mask |= (1 << 1);
		}
		if(leds & (1 << 4)){
			mask |= (1 << 0);
		}
		if(leds & (1 << 15)){
			mask |= (1 << 6);
		}
		if(leds & (1 << 5)){
			mask |= (1 << 7);
		}
		PORTB = mask;
		DDRB = 4 | mask;
	} else {
		// line 3
		if(leds & (1 << 8)){
			mask |= (1 << 1);
		}
		if(leds & (1 << 7)){
			mask |= (1 << 2);
		}
		if(leds & (1 << 6)){
			mask |= (1 << 6);
		}
		if(leds & (1 << 12)){
			mask |= (1 << 0);
		}
		PORTB = mask;
		DDRB = 128 | mask;	
		
		x++;
		if(leds_brd | leds_brd_su) leds = leds_brd | leds_brd_su;
		else{
			if(0 == ((x >> 12) & 7)) if(leds_capi) leds = leds_capi;
			if(1 == ((x >> 12) & 7)) if(leds_zi) leds = leds_zi;
			if(2 == ((x >> 12) & 7)) if(leds_zg) leds = leds_zg;
			if(3 == ((x >> 12) & 7)) if(leds_capo) leds = leds_capo;
			if(4 == ((x >> 12) & 7)) if(leds_zo) leds = leds_zo;
			if(5 == ((x >> 12) & 7)) if(leds_zio) leds = leds_zio;
			//if(6 == ((x >> 12) & 7)) if(leds_oc) leds = leds_oc;
			leds_tmp = leds_capi | leds_capo | leds_zi | leds_zo | leds_zio | leds_zg | leds_v;// | leds_oc;
			if(!(leds_tmp & (1 << 13))) leds = leds_tmp |= (1 << 12);
			if(6 == ((x >> 13) & 7)) if(leds_tmp) leds = leds_tmp;
		}
		
	}
	led_row++;


	
}

/*
ISR (ADC_vect)
{
	static int32_t x, y, k;
	k = 1024;
	x += (((int32_t)ADC) * k - x)/k;
	if(x<0) x = 0;
	y = x / k;
	leds = ADC2LED(y);
	//ADCSRA = ADCSRA;
}
*/

int16_t ADC_blocking_in(int8_t channel)
{
	ADMUX = (1 << REFS1) | (1 << REFS0) | channel;
	ADCSRA = (1 << ADEN) | (0 << ADIE) | (1 << ADSC) | (0 << ADATE) | 6;
	ADCSRB = 0;
	while(!(ADCSRA & (1 << ADIF)));
	ADCSRA |= (1 << ADIF);
	return ADC;
}

int32_t CAP_blocking_in(int8_t chan, int32_t Ucc)
{
	int32_t C, Ucap;
	int16_t i, k;
	Ucap = 0;
	k = 1000;
	for(i=0;i<k;i++){ // Ucapi += 16 for 1uF
		Ucap = ADC_blocking_in(2);
		Ucap -= ADC_blocking_in(chan);
		if (Ucap > 100) break;
	}
	Ucap = Ucap * 1000 / i; // 16000 for 1 uF
	C = 42*(Ucc - 120000) / Ucap; // Ci in 1 nF	
	return C;
}


int32_t measure_vreg_outp_volt(void)
{
	int32_t Uout;
	int16_t i, k;
	Uout = 0;
	k = 1000;
	for(i=0;i<k;i++){
		Uout += ADC_blocking_in(1);
		Uout -= ADC_blocking_in(2);
	}
	Uout /= k;	
	return Uout;
}


int32_t measure_vreg_inp_volt(void)
{
	int32_t Uout;
	int16_t i, k;
	Uout = 0;
	k = 1000;
	for(i=0;i<k;i++){
		Uout += ADC_blocking_in(3);
		Uout -= ADC_blocking_in(2);
	}
	Uout /= k;
	return Uout;
}

int32_t measure_vreg_inout_volt(void)
{
	int32_t Uout;
	int16_t i, k;
	Uout = 0;
	k = 1000;
	for(i=0;i<k;i++){
		Uout += ADC_blocking_in(3);
		Uout -= ADC_blocking_in(1);
	}
	Uout /= k;
	return Uout;
}

void start_step_up(int32_t Ucc)
{
	OCR0A = 70 * 200000/Ucc +132;
}

void start_step_up_low(int32_t Ucc)
{
	OCR0A = 10 * 200000/Ucc +20;
}

void stop_step_up(void)
{
	OCR0A = 0;
}

int main(void)
{

	int32_t Uout, Ci, Co, Ucc, Ustepup, Uin, Uinout;
	int16_t i, k;

	DDRD = 255;
	DDRC = 1 << 5;
	DDRB = 199;
	PORTD = 1;
	TCNT0 = 0;
	OCR0A = 0; //192;
	//OCR0A = 192;
	TCCR0A = (1 << COM0A1) | (1 << WGM00) | (1 << WGM01);
	TCCR0B = (1 << CS00);
	TIMSK0 = (1 << TOIE0);
	
	ADMUX = (1 << REFS1) | (1 << REFS0) | 1;
	ADCSRA = (1 << ADEN) | (1 << ADIE) | (1 << ADSC) | (1 << ADATE) | 7;
	ADCSRB = 0;
	sei();
  
  
	PORTC = 0;
	PORTD = 1+8;
	
	
	//PORTD = (1 << 4) | (1 << 3);
	
	//while(1){}
  
    while(1)
    {
		PORTD = (1 << 5) | (1 << 3);
		PORTC = (1 << 5);
		measure_vreg_outp_volt(); // wait
		// check output voltage
		PORTC = 0;
		PORTD = 1 + 8;
		measure_vreg_outp_volt(); // dummy read/wait
		Uout = measure_vreg_outp_volt();
		leds_v = ADC2LED(Uout);
		if(Uout > 150) {
			leds_v |= (1 << 13) | (1 << 14) | (1 << 8);

		} else if (Uout < 11) {
			leds_v |= (1 << 13) | (1 << 15) | (1 << 8);

		}
		
		// check input capacity - reverse (!), regulator and output cap off 
		// get supply voltage for capacity measurement
		Ucc = 0;
		k = 1000;
		for(i=0;i<k;i++){
			Ucc += ADC_blocking_in(0);
		}
		if(Ucc < 200000){
			leds_brd = (1 << 13) | (1 << 15);
			leds = leds_brd;
			continue;
		} else if(Ucc > 250000){
			leds_brd = (1 << 13) | (1 << 14);
			leds = leds_brd;
			continue;
		} else {
			leds_brd = 0;
		}
		
		// capacity measurement
		PORTD = (1 << 5) | (1 << 3);
		PORTC = (1 << 5);
		for(i=0;i<100;i++);
		PORTD = (1 << 2);
		Ci = CAP_blocking_in(3, Ucc);
		
		if(Ci > 1500){
			leds_capi = (1 << 9) | (1 << 7) | (1 << 6) | (1 << 13) | (1 << 14);
		} else if(Ci < 500){
			leds_capi = (1 << 9) | (1 << 7) | (1 << 6) | (1 << 13) | (1 << 15);
		}else{
			leds_capi = 0;
		}
		//if(leds_capi) leds = leds_capi;
		PORTD = (1 << 5) | (1 << 3);
		PORTC = (1 << 5);
		for(i=0;i<100;i++);
		PORTC = 0;
		PORTD = (1 << 2) | (1 << 5);
		Co = CAP_blocking_in(1, Ucc);
		leds_capo = 0;
		if(Co > 15000){
			leds_capo |= (1 << 9) | (1 << 7) | (1 << 8) | (1 << 13) | (1 << 14);
		} else if(Co < 5000){
			leds_capo |= (1 << 9) | (1 << 7) | (1 << 8) | (1 << 13) | (1 << 15);
		}
		//if(leds_capo) leds = leds_capo;

		//leds = leds_tmp;
		PORTD = 0;
		PORTC = 0;
		start_step_up(Ucc);
		for(i=0;i<10000;i++);
		// check stepup
		Ustepup = 0;
		k = 1000;
		for(i=0;i<k;i++){
			Ustepup += ADC_blocking_in(0);
		}
		Ustepup /= k;
		if(Ustepup < 910){
			leds_brd_su = (1 << 13);
			leds = leds_brd_su;
		}else{
			leds_brd_su = 0;
		}
		// output z-diode
		PORTD = (1 << 4) | (1 << 3);
		for(i=0;i<1;i++) measure_vreg_outp_volt();
		Uout = measure_vreg_outp_volt();
		if(Uout > 870){
			leds_zo |= (1 << 10) | (1 << 13) | (1 << 14) | (1 << 8); // overvoltage protection not working, too high voltage
		} else if(Uout < 50) {
			leds_zo |= (1 << 11) | (1 << 13) | (1 << 8); // overvoltage protection diode short circuit
		} else if(Uout < 600){
			leds_zo |= (1 << 10) | (1 << 13) | (1 << 15) | (1 << 8); // overvoltage protection with too low breakdown voltage
		} else {
			leds_zo = 0;
		}
		// input z-diode
		PORTD = (1 << 0) | (1 << 3);
		for(i=0;i<1;i++) measure_vreg_inp_volt();
		Uin = measure_vreg_inp_volt();
		
		if(Uin > 870){
			leds_zi = (1 << 10) | (1 << 13) | (1 << 14) | (1 << 6); // overvoltage protection not working, too high voltage
		} else if(Uin < 50) {
			leds_zi = (1 << 11) | (1 << 13) | (1 << 6); // overvoltage protection diode short circuit
		} else if(Uin < 600){
			leds_zi = (1 << 10) | (1 << 13) | (1 << 15) | (1 << 6); // overvoltage protection with too low breakdown voltage
		} else {
			leds_zi = 0;
		}
		// gnd z-diode
		PORTC = (1 << 5);
		PORTD = (1 << 2);
		for(i=0;i<1;i++) measure_vreg_inp_volt();
		Uin = -measure_vreg_inp_volt();
		if(Uin > 870){
			leds_zg = (1 << 10) | (1 << 13) | (1 << 14) | (1 << 7); // overvoltage protection not working, too high voltage
		} else if(Uin < 50) {
			leds_zg = (1 << 11) | (1 << 13) | (1 << 7); // overvoltage protection diode short circuit
		} else if(Uin < 600){
			leds_zg = (1 << 10) | (1 << 13) | (1 << 15) | (1 << 7); // overvoltage protection with too low breakdown voltage
		} else {
			leds_zg = 0;
		}
		// output to input z-diode
		PORTC = (1 << 5);
		PORTD = (1 << 4);		
		measure_vreg_inout_volt();
		Uinout = -measure_vreg_inout_volt();
		if(Uinout > 870){
			leds_zio = (1 << 10) | (1 << 13) | (1 << 14) | (1 << 6) | (1 << 8); // overvoltage protection not working, too high voltage
		} else if(Uinout < 50) {
			leds_zio = (1 << 11) | (1 << 13) | (1 << 6) | (1 << 8); // overvoltage protection diode short circuit
		} else if(Uinout < 600){
			leds_zio = (1 << 10) | (1 << 13) | (1 << 15) | (1 << 6) | (1 << 8); // overvoltage protection with too low breakdown voltage
		} else {
			leds_zio = 0;
		}
		//if(leds_z) leds = leds_z;
		
		/*
		// check regulator overcurrent protection
		start_step_up_low(Ucc);
		PORTC = 0;
		PORTD = (1 << 3) | (1 << 5) | (1 << 7);
		for(i=0;i<1;i++) measure_vreg_inp_volt();
		Uin = measure_vreg_inp_volt();
				
		if(Uin < 100){
			leds_oc = (1 << 8) | (1 << 13) | (1 << 14) | (1 << 6);
		} else {
			leds_oc = 0;
		}
		*/
		stop_step_up();

	
		
       
    }
}