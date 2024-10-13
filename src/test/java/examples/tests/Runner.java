package examples.tests;

import com.intuit.karate.junit5.Karate;

class Runner {
    @Karate.Test
    public Karate runUser() {
        return Karate.run("userRequest").relativeTo(getClass());
    }

    @Karate.Test
    public Karate runpet() {
        return Karate.run("petRequest").relativeTo(getClass());
    }
}
