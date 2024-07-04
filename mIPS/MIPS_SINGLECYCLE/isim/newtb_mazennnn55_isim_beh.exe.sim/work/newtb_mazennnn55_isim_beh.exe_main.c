/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_3620187407;
char *IEEE_P_2592010699;
char *IEEE_P_3499444699;
char *IEEE_P_1242562249;
char *STD_STANDARD;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_1242562249_init();
    work_a_1574564257_3212880686_init();
    work_a_4168119205_3212880686_init();
    work_a_0234046788_3212880686_init();
    work_a_3671225186_3212880686_init();
    work_a_0347389695_3212880686_init();
    work_a_4118832694_3212880686_init();
    work_a_0237074016_3212880686_init();
    work_a_3030916117_3212880686_init();
    work_a_4292780724_3212880686_init();
    work_a_0674130957_3212880686_init();
    work_a_3282084988_3212880686_init();
    work_a_2529720499_3212880686_init();
    work_a_1058057849_3212880686_init();
    work_a_1591159045_3212880686_init();
    work_a_2790021516_2372691052_init();


    xsi_register_tops("work_a_2790021516_2372691052");

    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_STANDARD = xsi_get_engine_memory("std_standard");

    return xsi_run_simulation(argc, argv);

}
