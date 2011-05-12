$(document).ready(function(){
    /*
     * ANIMAZIONE DI SCOMPARSA PER I CAMPI DELLA FORM CON FIELDS-FOR
     */
    $(".fields a").click(function(){
        $(this).prev("input[type=hidden]").val("1");
        $(this).closest(".fields").fadeOut("slow");
    });

    /*
     * VISUALIZZA I DETTAGLI AL CLICK SOLO PER IL TR CORRENTE NELLA TABELLA INDEX
     */
    $("a.model-details").click(function(){
        // visualizzo i dettagli solo se dopo di me è presente un div di dettagli
        if ($($(this).parent().parent().next().find("table")).length > 0)
        {
            $(this).parent().parent().next().toggle();
        }
        return false;
    });
    
    /*  
     * VISUALIZZA O NASCONDE TUTTI I DETTAGLI DELLA TABELLA IN INDEX
     */
    $(".expand-all").click(function(){
    	var div_immagine = $(this).find("div").first();
    	var div_testo = $(this).find("div").last();
    	if (div_testo.html().match("Espandi tutto"))
    	{
            // Cambia il testo, cambia immagine, visualizza tutti i tr nascosti
            div_testo.html("Chiudi tutto");
            div_immagine.removeClass("ui-icon-arrowstop-1-s").addClass("ui-icon-arrowstop-1-n");
            $(this).closest("table").find("tr.hidden").each(function(){
            if ($($(this).find("table")).length > 0)
            {
    		$(this).show();
            }
            });
    	}
    	else
    	{
            // Cambia il testo, cambia immagine, nascondi tutti i tr visualizzati
            div_testo.html("Espandi tutto");
            div_immagine.removeClass("ui-icon-arrowstop-1-n").addClass("ui-icon-arrowstop-1-s");
            $(this).closest("table").find("tr.hidden").each(function(){
    		$(this).hide();
            });
    	}
    	return false;
    });
    
    /*
     * GESTIONE DATEPICKER FORM ORDINI
     */
    $("#order_date, #order_expiration_date, #delivery_date").datepicker({
    	dateFormat : 'dd/mm/yy'
    });
    
});



//css("border","3px solid red");