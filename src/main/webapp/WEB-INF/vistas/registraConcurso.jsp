<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<script type="text/javascript" src="js/redireccionar.js"></script>

<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<title>Registra Concurso</title>
</head>
<body>

	<div class="container">
		<p class="h1">Registra Concurso</p>

		<form id="id_form" class="needs-validation" novalidate>
			<div class="row " style="margin-top: 5%;">
				<div class="form-group  col-md-12 position-relative">
					<div class="col-sm-1">
						<label class="control-label" for="id_nombre">Nombre</label>

					</div>
					<div class="col-sm-11">
						<input class="form-control" type="text" id="id_nombre"
							name="nombre" required>
					</div>
				</div>
			</div>
			<div class="row g-3" style="margin-top: 2rem">
				<div class="col-sm-6 position-relative">
					<div class="from-group col-md-5">
						<label class="control-label" for="id_fecha_start">Fecha
							Inicio</label>
					</div>
					<div class="form-group col-md-7">
						<div class="input-group mb-3">
							<input type="date" id="id_fecha_start" class="form-control"
								name="fechaInicio" placeholder="Ingrese Precio" required>

						</div>
					</div>
				</div>
				<div class="col-sm-6 position-relative">
					<div class="from-group col-md-5">
						<label class="control-label" for="id_fecha_fin">Fecha Fin</label>
					</div>
					<div class="form-group col-md-7">
						<div class="input-group mb-3">
							<input type="date" id="id_fecha_fin" class="form-control "
								name="fechaFin" required>

						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12" style="margin-bottom: 4rem;" align="center">
				<button id="id_registrar" type="submit"
					class="btn btn-primary btn-lg">Registrar</button>
							
			</div>
		
		</form>
		<div class="col-md-12" align="center">
			<div class="col-md-4 form-group">
				<button id="id_MedicamentoBootstrap5" type="button"
					class="btn btn-success btn-lg">Bootstrap5</button>
			</div>
			<div class="col-md-4 form-group">
				<button id="id_verMedicamento" type="button"
					class="btn btn-success btn-lg">Medicamento</button>
			</div>
			<div class="col-md-4 form-group">
				<button id="id_verConcurso" type="button"
					class="btn btn-success btn-lg">Concurso</button>
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
			$('#id_fecha_start').val('');
			$('#id_fecha_fin').val('');
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
					dni : {
						selector : "#id_fecha_start",
						validators : {
							notEmpty : {
								message : 'La fecha es obligatoria'
							}
						}
					},
					correo : {
						selector : "#id_fecha_fin",
						validators : {
							notEmpty : {
								message : 'La fecha es obligatoria'
							}
						}
					},
					
				}
			});

		});
	</script>

</body>
</html>




