<!doctype html>
<html lang="pt-br">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Ministério da Defesa!</title>
</head>

<body class="container">
    <section>
        <article class="text-center">
        <h1 class="text-bold">Imagem Base utilizada pelo Ministério da Defesa!</h1> 
        <br> 
        HTTP_HOST: <?= $_SERVER['HTTP_HOST']?>
        <br>
        Apache Version: <?= $_SERVER['SERVER_SOFTWARE']?>
        </article>
    </section>
</body>

</html>

<?php

    // Show all information, defaults to INFO_ALL
    phpinfo();

?>