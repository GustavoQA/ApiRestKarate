function fn() {    
  //var env = karate.env; // get system property 'karate.env'
  karate.configure('logPrettyResponse', true)
  var env = java.lang.System.getenv('karateEnv');
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'qa';
  }
  var config = {
    env: env,
	myVarName: 'someValue'
  }
  if (env == 'local') {
    config.url = "http://localhost"
  } else if (env == 'dev') {
    config.url = "https://restful-booker.herokuapp.dev.com"
  }else if (env == 'qa') {
    config.url = "https://restful-booker.herokuapp.com"
     }
  return config;
}