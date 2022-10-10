

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Control de Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
   <script src="https://kit.fontawesome.com/25b01d53ac.js" crossorigin="anonymous"></script>
    </head>
    <body>
       <!--Cabecero-->
       <jsp:include page="/paginas/comunes/cabecero.jsp"></jsp:include>
       
       <!--botones de navegacion-->
       
       <jsp:include page="/paginas/comunes/botonesNavegacion.jsp"/>
       
       <!--listado clientes-->
       <jsp:include page="/paginas/cliente/listadoClientes.jsp"/>
        
        
        <jsp:include page="/paginas/comunes/piePagina.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
    </body>
</html>
