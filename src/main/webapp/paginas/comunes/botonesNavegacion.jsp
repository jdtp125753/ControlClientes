<section id="actions" class="py-4 mb-4 bg-light">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <!--button modal-->
                <button type="button" class = "btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#agregarClienteModal">
                    <i class="fas fa-plus"></i> Agregar Cliente
                </button>
            </div>
        </div>
    </div>
</section>

<!-- cliente Modal-->
<div class="modal fade" id="agregarClienteModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-info text-white">
                <h5 class="modal-title">Agregar cliente </h5>
                <button type="button" class="btn-close"  data-bs-dismiss="modal" arial-label="Close"></button>
            </div>
            <form action="${pageContext.request.contextPath}/ServletControlador?accion=insertar"
                  method="post" class="was-validated">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" name="nombre" required> 
                    </div> 
                    <div class="form-group">
                        <label for="apellido">Apellido</label>
                        <input type="text" class="form-control" name="apellido" required> 
                    </div>
                     <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" name="email" required> 
                    </div>
                     <div class="form-group">
                        <label for="telefono">telefono</label>
                        <input type="number" class="form-control" name="telefono" step="any" required> 
                    </div>
                     <div class="form-group">
                        <label for="saldo">Saldo</label>
                        <input type="number" class="form-control" name="saldo" step="any" required> 
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="submit">guardar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
