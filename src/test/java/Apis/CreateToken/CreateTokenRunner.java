package Apis.CreateToken;

import com.intuit.karate.junit5.Karate;

public class CreateTokenRunner {

    @Karate.Test
    Karate testBooking() {
        return Karate.run("CreateToken").relativeTo(getClass());
    }
}
