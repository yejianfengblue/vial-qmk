/*
Copyright 2018 Mattia Dal Ben <matthewdibi@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "sg99.h"

void led_init(void) {
    gpio_set_pin_output(C15);
    gpio_set_pin_output(C14);
    gpio_set_pin_output(F1);
    gpio_set_pin_output(F0);
    
    wait_ms(1000);
    
    gpio_write_pin_high(C15);
    gpio_write_pin_high(C14);
    gpio_write_pin_high(F1);
    gpio_write_pin_high(F0);
    
    gpio_write_pin_low(C15);
    gpio_write_pin_low(C14);
    gpio_write_pin_low(F1);
    gpio_write_pin_low(F0);
}


void matrix_init_kb(void) {
	// put your keyboard start-up code here
	// runs once when the firmware starts up
	matrix_init_user();
	led_init();
}

