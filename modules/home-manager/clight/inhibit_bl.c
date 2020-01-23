#include <clight/public.h>

/**
 * Small example custom module for Clight.
 *
 * It just hooks on INHIBIT state updates and:
 * -> when entering INHIBIT state (eg: start watching a movie), sets 100% backlight and disable automatic calibration;
 * it can switch off your keyboard backlight too, if you wish (just uncomment proper lines).
 * -> when leaving INHIBIT state, triggers a new backlight calibration and re-enables automatic calibration
 **/

/*
 * Rename to: inhibit_bl.c
 *
 * Build with: gcc -shared -fPIC inhibit_bl.c -o inhibit_bl -Wno-unused
 *
 * Place inhibit_bl in: $HOME/.local/share/clight/modules.d/ OR, globally, in /usr/share/clight/modules.d/
 */

CLIGHT_MODULE("INHIBIT_BL");

DECLARE_MSG(capture_req, CAPTURE_REQ);
DECLARE_MSG(calib_req, NO_AUTOCALIB_REQ);
DECLARE_MSG(kbd_bl_req, KBD_BL_REQ);

static void init(void) {
    capture_req.capture.reset_timer = false; // avoid resetting clight internal BACKLIGHT timer
    kbd_bl_req.bl.new = 0.0; // switch off kbd backlight while inhibited

    /* Subscribe to inhibit state */
    M_SUB(INHIBIT_UPD);
}

static void receive(const msg_t *msg, const void *userdata) {
    switch (MSG_TYPE()) {
    case INHIBIT_UPD: {
        inhibit_upd *up = (inhibit_upd *)MSG_DATA();
        calib_req.nocalib.new = up->new;
        if (up->new) {
            M_PUB(&calib_req);      // stop backlight autocalibration
            M_PUB(&kbd_bl_req);     // set 0% kbd backlight
            INFO("Inhibited clight.\n");
        } else {
            INFO("Uninhibited.\n");
            M_PUB(&calib_req);      // resume backlight autocalibration
            M_PUB(&capture_req);    // ask for a quick calibration
        }
        break;
    }
    default:
        break;
    }
}
