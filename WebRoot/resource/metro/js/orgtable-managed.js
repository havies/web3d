/**
 * 
 */
var OrgtableManaged = function () {

    return {

        //main function to initiate the module
        init: function () {
            
            if (!jQuery().dataTable) {
                return;
            }

            // begin first table
            $('#example').dataTable({

                "ajax": "../Organization/queryForManage.action",
    	        "aoColumnDefs": [{"aTargets" :　[0],
					  "mRender" : function(data, type, full){
						            return "<input type='checkbox' class='checkboxes' value='"+data+"' />";
					  				}
                    },
                    
                    {"aTargets" :　[5],
						  "mRender" : function(data, type, full){
							 return '<a href="#updateorg" title="' + data + '" > 编辑</a>'
                                + '&nbsp;&nbsp;<a href="#deleteorg_2" >删除</a>';
						  				}
	                }
               ],
                "columns": [
                        { "data": "orgid" },
                        { "data": "name" },
                        { "data": "parentid" },
                        { "data": "leaderid" },
                        { "data": "orgid" },
                        { "data": "orgid" },
                        
                    ]

            });
            
            
           

            jQuery('#example .group-checkable').change(function () {
                var set = jQuery(this).attr("data-set");
                var checked = jQuery(this).is(":checked");
                jQuery(set).each(function () {
                    if (checked) {
                        $(this).attr("checked", true);
                    } else {
                        $(this).attr("checked", false);
                    }
                });
                jQuery.uniform.update(set);
            });

            jQuery('#example_wrapper .dataTables_filter input').addClass("m-wrap medium"); // modify table search input
            jQuery('#example_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            //jQuery('#sample_1_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown

		 	
            // begin second table
           
        }

    };

}();