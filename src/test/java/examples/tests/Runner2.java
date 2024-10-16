package examples.tests;

import com.intuit.karate.junit5.Karate;

class Runner2 {
    @Karate.Test
    public Karate runMealPlan() {
        return Karate.run("mealPlanRequest")
                .relativeTo(getClass());
    }

    @Karate.Test
    public Karate runrecipes() {
        return Karate.run("recipes")
                .relativeTo(getClass());
    }



//    @Karate.Test
//    public Karate runUserConnect() {
//        return Karate.run("connectUser")
//                .relativeTo(getClass());
//    }
}
