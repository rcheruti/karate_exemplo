package dockermemory.pessoas;

import com.intuit.karate.junit5.Karate;

public class PessoasRunner {
  
  @Karate.Test
  Karate testUsers() {
      return Karate.run("pessoas").relativeTo(getClass());
  }
  
}
