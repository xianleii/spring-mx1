
(function($) {
    $.fn.bootstrapValidator.validators.chinesePhone = {
        validate: function(validator, $field, options) {
            var val = $.trim($field.val());
            // 三位或四位 区号，七位或八位 直播号，不考虑分机号
            var phone = /^(\d{3,4})?\d{7,8}$/;
            var cellphone = /^1[3456789]\d{9}$/;
            var isValid = phone.test(val) || cellphone.test(val);
            if (!isValid) {
                return {
                    valid: false,
                    message: '请输入正确的纯数字座机或手机格式'
                }
            }
            return true;
        }
    };
    $.fn.bootstrapValidator.validators.chinesePhoneWithSeparator = {
        validate: function(validator, $field, options) {
            var val = $.trim($field.val());
            // var phone = /^(((\d{3}-?)?[1-9]\d{7})|((\d{4}-?)?[1-9]\d{6}))$/;
            var phone = /^(\d{3,4})?\d{7,8}$/;
            var cellphone = /^1[3456789]\d-?\d{4}-?\d{4}$/;
            var isValid = phone.test(val) || cellphone.test(val);
            if (!isValid) {
                return {
                    valid: false,
                    message: '请输入正确的座机或手机格式，可使用-作为分隔符'
                }
            }
            return true;
        }
    };
}(window.jQuery));

/*
$.fn.bootstrapValidator.validators.notAnyEmpty = {
    validate: function(validator, $field, options) {
        var value = $field.val();
        if (value === '') {
            return true;
        }

        if (value.length < 8) {
            return false;
        }
        if (value === value.toLowerCase()) {
            return false;
        }
        if (value === value.toUpperCase()) {
            return false;
        }
        if (value.search(/[0-9]/) < 0) {
            return false;
        }

        return true;
    }
};*/
