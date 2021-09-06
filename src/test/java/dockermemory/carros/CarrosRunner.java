package dockermemory.carros;

import com.intuit.karate.junit5.Karate;

public class CarrosRunner {
  
  @Karate.Test
  Karate testUsers() {
      return Karate.run("carros").relativeTo(getClass());
  }
  
}
