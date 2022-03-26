package Apis.CreateBooking;

import com.intuit.karate.junit5.Karate;

public class CreateBookingRunner {

    @Karate.Test
    Karate testBooking() {
        return Karate.run("CreateBooking").relativeTo(getClass());
    }
}
