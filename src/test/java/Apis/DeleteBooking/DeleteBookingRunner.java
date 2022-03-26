package Apis.DeleteBooking;

import com.intuit.karate.junit5.Karate;

public class DeleteBookingRunner {

    @Karate.Test
    Karate testBooking() {
        return Karate.run("DeleteBooking").relativeTo(getClass());
    }
}
