package Apis.UpdateBooking;

import com.intuit.karate.junit5.Karate;

public class UpdateBookingRunner {

    @Karate.Test
    Karate testBooking() {
        return Karate.run("UpdateBooking").relativeTo(getClass());
    }
}
