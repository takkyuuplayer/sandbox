<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8" />
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.17/angular.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

    <script src="//cdnjs.cloudflare.com/ajax/libs/coffee-script/1.7.1/coffee-script.min.js"></script>
    <script type="text/coffeescript">
    </script>
  </head>
  <body>
  Test
  <form action="https://accounts.google.com/o/oauth2/auth" method="GET">
    <input type="text" name="client_id" value="395893303277-aa0fjruak91msg0vsts0jjbsr3c3kccl.apps.googleusercontent.com">
    <input type="text" name="response_type" value="code">
    <input type="text" name="scope" value="openid email">
    <input type="text" name="redirect_uri" value="http://localhost/google/">
    <input type="text" name="state" value="security_token">

    <input type="submit" class="btn btn-primary">
  </form>
<hr>
<h1>After redirect</h1>
<?php var_dump($_GET); ?>
<?php var_dump($_POST); ?>

  <form action="https://accounts.google.com/o/oauth2/token" method="POST">
    <input type="text" name="client_id" value="395893303277-aa0fjruak91msg0vsts0jjbsr3c3kccl.apps.googleusercontent.com">
    <input type="text" name="client_secret" value="isFaYj5gmwMHsA6djfMIbu_I">
    <input type="text" name="scope" value="openid email">
    <input type="text" name="redirect_uri" value="http://localhost/google/">
    <input type="text" name="code" value="<?php echo $_GET['code']; ?>">
    <input type="text" name="grant_type" value="authorization_code">

    <input type="submit" class="btn btn-primary">
  </form>
<hr>
<h1>After redirect 2</h1>
<?php var_dump($_GET); ?>
<?php var_dump($_POST); ?>
  </body>
</html>
