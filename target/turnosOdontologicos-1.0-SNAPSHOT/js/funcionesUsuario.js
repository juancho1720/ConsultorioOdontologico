
$(document).ready(function () {
    
    $(document).on('click', '.btn_prueba', function(e){
    e.preventDefault();
    var cod = $(this).parent().find('#id_eliminar').val();

    swal({
            title: "Are you sure?",
            text: "You will not be able to recover this imaginary file!",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Yes, delete it!",
            cancelButtonText: "No, cancel plx!",
            closeOnConfirm: false,
            closeOnCancel: false
        },
                function (isConfirm) {
                    if (isConfirm) {
                        eliminarUsuario(cod);
                        swal("Deleted!", "Your imaginary file has been deleted.", "success");
                    } else {
                        swal("Cancelled", "Your imaginary file is safe :)", "error");
                    }
                });

    });
    
    
    function eliminarUsuario(cod){
        
        var url = "/SvEliminarUsuarios?id=" + cod;
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            succes: function(r){
                
            }
        });
    }
    
});


