<script type="text/javascript">
#foreach($grant in $grantList)
#if(${grant.partauthtype} == "5")
#if(${grant.cmptype} == "4")
mainGridHeader['${grant.cmpid}'] = true;     
#end
#end 
#if(${grant.partauthtype} == "6")
#if(${grant.cmptype} == "4")
mainGridHeader['${grant.cmpid}'] = false;    
#end
#end
#end

Ext.onReady(function() {
#foreach($grant in $grantList)
	if(Ext.getCmp('${grant.cmpid}')){
	    #if(${grant.partauthtype} == "1")
	        #if(${grant.cmptype} == "1" || ${grant.cmptype} == "3")
            Ext.getCmp('${grant.cmpid}').disable();
            #end
            #if(${grant.cmptype} == "2")
            Ext.getCmp('${grant.cmpid}').disable();
            Ext.getCmp('${grant.cmpid}').addClass('x-custom-field-disabled');
            #end
        #end 
	    #if(${grant.partauthtype} == "2")
	        #if(${grant.cmptype} == "1" || ${grant.cmptype} == "3")
	        Ext.getCmp('${grant.cmpid}').enable();
	        #end
	        #if(${grant.cmptype} == "2")
	        Ext.getCmp('${grant.cmpid}').enable();
            Ext.getCmp('${grant.cmpid}').removeClass('x-custom-field-disabled');
            #end
        #end 
        #if(${grant.partauthtype} == "3")
            #if(${grant.cmptype} == "2")
            Ext.getCmp('${grant.cmpid}').setReadOnly(true);
            Ext.getCmp('${grant.cmpid}').addClass('x-custom-field-disabled');
            #end
        #end 
        #if(${grant.partauthtype} == "4")
            #if(${grant.cmptype} == "2")
            Ext.getCmp('${grant.cmpid}').setReadOnly(false);
            Ext.getCmp('${grant.cmpid}').removeClass('x-custom-field-disabled');
            #end
        #end 
        #if(${grant.partauthtype} == "5")
            #if(${grant.cmptype} == "1" || ${grant.cmptype} == "3")
            Ext.getCmp('${grant.cmpid}').show();
            #end
            #if(${grant.cmptype} == "2")
            Ext.getCmp('${grant.cmpid}').show();
            #end
        #end 
        #if(${grant.partauthtype} == "6")
            #if(${grant.cmptype} == "1" || ${grant.cmptype} == "3")
            Ext.getCmp('${grant.cmpid}').hide();
            #end
            #if(${grant.cmptype} == "2")
            Ext.getCmp('${grant.cmpid}').hide();
            #end
        #end
        #if(${grant.partauthtype} == "7")
            #if(${grant.cmptype} == "2")
            Ext.getCmp('${grant.cmpid}').allowBlank = false;
            Ext.getCmp('${grant.cmpid}').fieldLabel += '<font color=red>*</font>';
            #end
        #end
        #if(${grant.partauthtype} == "8")
            #if(${grant.cmptype} == "2")
            Ext.getCmp('${grant.cmpid}').allowBlank = true;
            var grantedFieldLabel = Ext.getCmp('${grant.cmpid}').fieldLabel;
            Ext.getCmp('${grant.cmpid}').fieldLabel = grantedFieldLabel.substring(0, grantedFieldLabel.length - 24);
            #end
        #end
	}
#end
});
    
</script>