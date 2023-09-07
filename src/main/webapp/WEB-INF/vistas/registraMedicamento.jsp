<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<script type="text/javascript" src="js/redireccionar.js"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<style type="text/css">
label {
	font-size: 1.5em;
}

#id_form {
	background: #f0f0f0;
	border-radius: 20px;
	align-items: center;
	margin: 1.10em;
	padding: 0.05em 2.1em;
	box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 3px, rgba(0, 0, 0, 0.24) 0px 1px
		2px;
}

.h1 {
	text-align: center;
	padding-top: 5%;
	font-weight: bold;
}

.btn {
	font-weight: bold;
}
</style>
<title>REGISTRAR MEDICAMENTO</title>
</head>
<body>

	<div class="container">
		<p class="h1">Registra Medicamento</p>

		<form id="id_form" class="needs-validation" novalidate>
			<div class="row " style="margin-top: 5%;">
				<div class="form-group  col-md-12 position-relative">
					<div class="col-sm-1">
						<label class="control-label" for="id_nombre">Nombre</label>

					</div>
					<div class="col-sm-11">
						<input class="form-control" type="text" id="id_nombre"
							name="nombre" placeholder="Ingrese nombre de medicamento"
							required>
						<div class="invalid-tooltip">Campo Obligatorio</div>
					</div>
				</div>
			</div>
			<div class="row g-3" style="margin-top: 2rem">
				<div class="col-sm-4 position-relative">
					<div class="from-group col-md-5">
						<label class="control-label" for="id_precio">Precio</label>
					</div>
					<div class="form-group col-md-7">
						<div class="input-group mb-3">
							<span class="input-group-text">S/.</span> <input type="number"
								id="id_precio" class="form-control " name="precio"
								placeholder="Ingrese Precio" required>

							<div class="invalid-tooltip">Campo Obligatorio</div>
						</div>
					</div>
				</div>
				<div class="col-sm-4 position-relative">
					<div class="form-group col-md-5 ">
						<label class="control-label" for="id_stock">Stock</label>
					</div>
					<div class="form-group col-sm-7">
						<input class="form-control" min="0" placeholder="Ingrese Stock"
							id="id_stock" name="stock" type="text" required>
						<div id="id_stock_val" class="invalid-tooltip">Campo
							Obligatorio</div>
					</div>
				</div>
				<div class="col-sm-4 ">
					<div class=col-md-5>
						<label class="control-label" for="id_laboratorio">Laboratorio</label>
					</div>
					<div class="col-sm-7 position-relative">
						<select class="form-select" id="id_laboratorio" name="laboratorio"
							required>
							<option selected disabled value="">Seleccione
								Laboratorio</option>
							<option value="Bayer">Bayer</option>
							<option value="Abbott">Abbott</option>
						</select>
						<div class="invalid-tooltip">Seleccione Laboratorio</div>

					</div>
				</div>
			</div>
			<div class="col-md-12" style="margin-bottom: 4rem;" align="center">
				<button id="id_registrar" type="submit"
					class="btn btn-primary btn-lg">Registrar</button>
			</div>
		</form>
		<div class="row g-3" >
				<div class="form-group  col-md-12 position-relative">
				<div class="col-md-4 ">
					<button id="id_MedicamentoBootstrap5" type="button"
						class="btn btn-success ">Bootstrap5</button>
				</div>
				<div class="col-sm-4 ">
					<button id="id_verMedicamento" type="button"
						class="btn btn-success ">Medicamento</button>
				</div>
				<div class="col-sm-4 ">
					<button id="id_verConcurso" type="button" class="btn btn-success ">Concurso</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
	$("#id_registrar").click(function() {
		//Lanza la validacion
		var validator = $('#id_form').data('bootstrapValidator');
		validator.validate();

		if (validator.isValid()) {
			console.log('Es valido');
			console.log($('#id_form').serialize());
			$.ajax({
				type : "POST",
				url : "insertarConcurso",
				data : $('#id_form').serialize(),
				success : function(data) {
					limpiar();
					validator.resetForm();
					mostrarMensaje(data.MENSAJE);
				},
				error : function() {
					mostrarMensaje(data.MSG_ERROR);
				}
			});
		}
	});

		function limpiar() {
			$('#id_nombre').val('');
			$('#id_precio').val('');
			$('#id_stock').val('');
			$('#id_laboratorio').val('');
		}
		
		(() => {
			  'use strict'

			  // Fetch all the forms we want to apply custom Bootstrap validation styles to
			  const forms = document.querySelectorAll('.needs-validation')

			  // Loop over them and prevent submission
			  Array.from(forms).forEach(form => {
			    form.addEventListener('submit', event => {
			      if (!form.checkValidity()) {
			        event.preventDefault()
			        event.stopPropagation()
			      }
			      form.classList.add('was-validated')
			    }, false)
			  })
			})()
		

	</script>

	<script>
  document.getElementById("id_stock").addEventListener("input", function() {
    const input = this.value;
    const regex = /^[0-9]*$/;
	
    if (!regex.test(input)) {
      document.getElementById("id_stock_val").textContent = "Por favor, ingresa solo números.";
     
    } else {
      document.getElementById("id_stock_val").textContent = "";
      
    }
  });
</script>

</body>
</html>




