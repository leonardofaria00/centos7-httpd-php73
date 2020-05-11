<!doctype html>
<html lang="pt-br">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/my-style.css">

    <title>Ministério da Defesa!</title>
</head>

<body class="container">
    <div class="card text-center">
        <img class="logophp img-fluid" width="100" src="assets/img/logo.png" alt="Ministério da Defesa">
        <div class="card-body">
            <h5 class="card-title">Gerência de Sistemas e Inovação - GESIS</h5>
            <p class="card-text">Imagem Base utilizada pelo Ministério da Defesa.</p>
            <a href="https://github.com/leonardofaria00/httpd-base" target="_blank" class="btn btn-primary">Ir para o
            repositório</a>
            <a href="index.html" class="btn btn-success">Voltar</a>
        </div>
    </div>
    <section class="card">
        <article class="text-center">
            <span class="font-weight-bold">Host:</span> <?= $_SERVER['HTTP_HOST']?>
            <br>
            <span class="font-weight-bold">Apache Version:</span> <?= $_SERVER['SERVER_SOFTWARE']?>
        </article>
        <div class="card-footer text-muted text-center">
            <span class="font-weight-bold">Date:</span> <?= date('m/d/Y h:i', time());?>
        </div>
    </section>
</body>

</html>