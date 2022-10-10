<%@page import="dominio.Cliente"%>
<%@page import="datos.*"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="es_MX"/>

<section id="clientes">
    <div class="container">
        <div class="row">
            <!--inicio de la tabla-->
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h4>Listado de Clientes</h4>
                    </div>
                    <table class="table table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th>nombre</th>
                                <th>saldo</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--Iteramos cada elemento de la lista de clientes-->
                            <c:forEach var="cliente" items = "${clientes}" varStatus="status">
                                <tr> 
                                    <td>${status.count}</td>
                                    <td>${cliente.nombre} ${cliente.apellido}</td>
                                    <td><fmt:formatNumber value="${cliente.saldo}" type="currency"/></td>     
                                    <td>
                                        <a href="${pageContext.request.contextPath}/ServletControlador?accion=editar&idCliente=${cliente.idCliente}" 
                                           class="btn btn-secondary">
                                            <i class="fas fa-angle-double-right"></i> Editar
                                        </a>
                                        <a href="${pageContext.request.contextPath}/ServletControlador?accion=eliminar&idCliente=${cliente.idCliente}" 
                                           class="btn btn-danger btn-block">
                                            <i class="fas fa-trash"></i> Eliminar
                                        </a>
                                    </td>
                                  
                             </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--fin de la tabla-->
            <!--Inicio de las Targetas para los totales-->
            <div class="col-md-3">
                <div class="card text-center bg-danger text-white mb-3">
                    <div class="card-body">
                        <h3>Saldo total </h3>
                        <h4 class="display-4">
                            <fmt:formatNumber value="${saldoTotal}" type="currency" />
                        </h4>
                        </div>  
                        </div>
                        <div class="card text-center bg-success text-white mb-3">
                            <div class="card-body">
                                <h3>Total clientes</h3> 
                                <h4 class="display-4">
                                    <i class="fas fa-users"></i> ${totalClientes}
                                </h4>
                            </div>
                    </div>
            </div>
            <!--Inicio de las Targetas para los totales-->
        </div>
    </div>
</section>




<!--<ul>
    
</ul>-->