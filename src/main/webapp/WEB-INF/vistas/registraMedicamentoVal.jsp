<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<title>Registra medicamento</title>
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
							<input type="text" id="id_precio" class="form-control "
								name="precio" placeholder="Ingrese Precio" required>

						</div>
					</div>
				</div>
				<div class="col-sm-4 position-relative">
					<div class="form-group col-md-5 ">
						<label class="control-label" for="id_stock">Stock</label>
					</div>
					<div class="form-group col-md-7">
						<input class="form-control" min="0" placeholder="Ingrese Stock"
							id="id_stock" name="stock" type="text">

					</div>
				</div>
				<div class="col-sm-4 position-relative">
					<div class="col-md-5 form-group">
						<label class="control-label" for="id_laboratorio">Laboratorio</label>
					</div>
					<div class="col-sm-7 form-group ">
						<select class="form-control" id="id_laboratorio"
							name="laboratorio" required>
							<option selected disabled value="">Seleccione
								Laboratorio</option>
							<option value="Bayer">Bayer</option>
							<option value="Abbott">Abbott</option>
						</select>

					</div>
				</div>
			</div>
			<div class="col-md-12" style="margin-bottom: 4rem;" align="center">
				<button id="id_registrar" type="submit"
					class="btn btn-primary btn-lg">Registrar</button>
				<button id="id_clean" type="button"
					class="btn btn-warning btn-lg">Clean</button>
				<a href="/verMedicamentoBootstrap5">Bootstrap5</a>
			</div>
		</form>
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
					url : "insertarMedicamento",
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
		$("#id_bootstrap5").click(function() {
			
			
		});

		$("#id_clean").click(function() {
			limpiar();
		});
		
		function limpiar() {
			$('#id_nombre').val('');
			$('#id_precio').val('');
			$('#id_stock').val('');
			$('#id_laboratorio').val('');
		}

		$(document).ready(function() {
			$('#id_form').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					nombre : {
						selector : "#id_nombre",
						validators : {
							notEmpty : {
								message : 'El nombre es obligatorio'
							},
							stringLength : {
								min : 3,
								max : 40,
								message : 'El nombre es de 3 a 40 caracteres'
							},
						}
					},
					precio : {
						selector : "#id_precio",
						validators : {
							notEmpty : {
								message : 'El campo es obligatorio'
							},
							regexp : {
								regexp :  /^[0-9]+$/,
								message : 'Solo números enteros'
							},
							stringLength : {
								min : 1,
								max : 5,
								message : 'El stock es de 1 a 5 caracteres'
							}
						}
					},
					stock : {
						selector : "#id_stock",
						validators : {
							notEmpty : {
								message : 'El campo es obligatorio'
							},
							regexp : {
								regexp :  /^[0-9]+$/,
								message : 'Solo números enteros'
							},
							stringLength : {
								min : 1,
								max : 5,
								message : 'El stock es de 1 a 5 caracteres'
							}
						}
					},
					laboratorio : {
						selector : "#id_laboratorio",
						validators : {
							notEmpty : {
								message : 'El laboratorio es obligatorio'
							}
						}
					},

				}
			});

		});
	</script>


</body>
</html>




