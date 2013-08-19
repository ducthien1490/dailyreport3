$("#button").click(function(e){                    
                    $(".required").each(function(){
                        if($(this).val() ==='' ) {   //prevent user leave page when not fill required fields
                            var id = $(this).attr('id');
                            $(this).focus();
                            $(this).attr('placeholder','Please fill required fields!');
                            e.preventDefault();
                            $(window).bind('beforeunload', function(){
                                return 'Are you sure to leave?If leave you will lost all data';
                            });
                        } // end if clause
                    });
                    var empty = $('.required').filter(function(){
                        return this.value ===''
                    });
                    if(!empty.length){
                        $('textarea').each(function(){
                            //ajax to auto submit answer form
                                var content = $(this).val();
                                var id = $(this).attr('id');
                                var token = $('#authenticity_token').val();
                                var user = $('#answer_user_id').val();
                                $.ajax({
                                    url: 'create',
                                    type: 'POST',
                                    data: {content: content, catalog_id: id,
                                            authenticity_token: token, user_id: user},
                                    success: function (){
                                        
                                    },
                                    error: function (){
                                        alert('Error');
                                    }
                                }); // end of ajax function   
                            }); //end function save or create
                        } // end if clause
                }); //end click functio