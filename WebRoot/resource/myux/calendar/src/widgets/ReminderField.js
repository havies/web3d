/*!
 * Ext JS Library 3.4.0
 * Copyright(c) 2006-2011 Sencha Inc.
 * licensing@sencha.com
 * http://www.sencha.com/license
 */
/**
 * @class Ext.calendar.ReminderField
 * @extends Ext.form.ComboBox
 * <p>A custom combo used for choosing a reminder setting for an event.</p>
 * <p>This is pretty much a standard combo that is simply pre-configured for the options needed by the
 * calendar components. The default configs are as follows:<pre><code>
    width: 200,
    fieldLabel: 'Reminder',
    mode: 'local',
    triggerAction: 'all',
    forceSelection: true,
    displayField: 'desc',
    valueField: 'value'
</code></pre>
 * @constructor
 * @param {Object} config The config object
 */
Ext.calendar.ReminderField = Ext.extend(Ext.form.ComboBox, {
    width: 200,
    fieldLabel: '提醒',
    mode: 'local',
    triggerAction: 'all',
    forceSelection: true,
    displayField: 'desc',
    valueField: 'value',

    // private
    initComponent: function() {
        Ext.calendar.ReminderField.superclass.initComponent.call(this);

        this.store = this.store || new Ext.data.ArrayStore({
            fields: ['value', 'desc'],
            idIndex: 0,
            data: [
            ['', '无'],
            ['0', '不提前'],
            ['5', '提前5分钟'],
            ['15', '提前15分钟'],
            ['30', '提前30分钟'],
            ['60', '提前1小时'],
            ['90', '提前1.5小时'],
            ['120', '提前2小时'],
            ['180', '提前3小时'],
            ['360', '提前6小时'],
            ['720', '提前12小时'],
            ['1440', '提前1天'],
            ['2880', '提前2天'],
            ['4320', '提前3天'],
            ['5760', '提前4天'],
            ['7200', '提前5天'],
            ['10080', '提前1周'],
            ['20160', '提前2周']
            ]
        });
    },

    // inherited docs
    initValue: function() {
        if (this.value !== undefined) {
            this.setValue(this.value);
        }
        else {
            this.setValue('');
        }
        this.originalValue = this.getValue();
    }
});

Ext.reg('reminderfield', Ext.calendar.ReminderField);
