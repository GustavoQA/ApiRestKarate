package Apis.GetBooking;

import com.intuit.karate.junit5.Karate;

public class GetBookingRunner {

    @Karate.Test
    Karate testBooking() {
        return Karate.run("GetBooking").relativeTo(getClass());
    }
}
