//jQuery.validator.addMethod("minWords", function (b, a, c) {
//    return !$(a).val() || $(a).val().split(/[\s\.\?]+/).length >= c
//}, "Please enter at least {0} words.");
//jQuery.validator.addMethod("maxWords", function (b, a, c) {
//    return !$(a).val() || $(a).val().split(/[\s\.\?]+/).length <= c
//}, "Please enter no more than {0} words.");
//jQuery.validator.addMethod("filesize", function (b, a, c) {
//    return this.optional(a) || (a.files[0].size <= c)
//});
$(".form-element").click(function (b) {
    b.preventDefault();
    var a = $(this).attr("class").replace(" form-element button1", "");
    main.addElement(main.lookUp(a));
    //adjustContainerHeight()
});
$(function () {
   // $("#form-tabs a").on("shown", function (e) {
  //      adjustContainerHeight()
   // });
    /*$("#form-elements li").draggable({
    revert: true,
    appendTo: "body",
    scroll: false
        
    });*/
});

function NameToProper(a) {
    return a.toLowerCase().replace(/^\s\s*/, "").replace(/\s\s*$/, "").replace(/ /g, "_").replace(/-/g, "_")
}
$("#form-options-label").live("keyup", function () {
    var c = main.cache;
    var d = NameToProper($(this).val());
    $("#form-options-name").val(d);
    var b = $("#form-options-checkbox").attr("checked");
    var a = $(this).val();
    if (b !== undefined) {
        a += '<div class="rqrd">*</div>'
    }
    c.find("input,select,textarea,div,h1").attr("id", d).attr("name", d);
    c.find("input:radio").attr("name", d).attr("id", "");
    c.find("input:checkbox").attr("id", "");
    c.children("label.field").html(a).attr("for", d);
    if (c.find("input:checkbox") !== null) {
        main.reloadElementOptions()
    }
});
$("#form-options-name").live("keyup", function () {
    var a = main.cache;
    var b = NameToProper($(this).val());
    a.find("input").attr("id", b).attr("name", b);
    a.find("input,select,textarea,div,h1").attr("id", b).attr("name", b);
    a.find("input:checkbox").attr("id", "").attr("name", b + "[]");
    a.children("label.field").attr("for", b)
});
$("#form-options-checkbox").live("change", function () {
    var d = main.cache;
    if ($(this).prop("checked")) {
        var a = d.find("span");
        var e = a.metadata({
            type: "attr",
            name: "data"
        });
        e.validate.required = true;
        e.validate.messages.required = "This field is required";
        a.attr("data", $.toJSON(e));
        var b = d.find("label.field").html();
        d.find("label.field").html(b.replace('<div class="rqrd">*</div>/g', "") + '<div class="rqrd">*</div>');
        var c = $('<label>Error Message</label><input id="form-options-message" value="This field is required." />');
        $(this).parent().append(c.hide().fadeIn(200))
    } else {
        var a = d.find("span");
        var e = a.metadata({
            type: "attr",
            name: "data"
        });
        e.validate.required = false;
        delete e.validate.messages.required;
        a.attr("data", $.toJSON(e));
        var b = d.find("label").html();
        d.find("label.field").html(b.replace('<div class="rqrd">*</div>', ""));
        $("#form-options-message").fadeOut(200, function () {
            $(this).remove();
            $("#form-options-check").find("label").remove()
        })
    }
});

$("#form-options-message").live("keyup", function () {
    var d = $(this).val();
    var b = main.cache;
    var a = b.find("input,select,textarea");
    if (a.attr("type") == "checkbox" || a.attr("type") == "radio") {
        a = a.parent().parent()
    } else {
        a = a.parent()
    }
    var c = a.metadata({
        type: "attr",
        name: "data"
    });
    if (c.validate !== undefined) {
        c.validate.messages.required = d
    }
    a.attr("data", $.toJSON(c))
});

$("#form-options-conditional-checkbox").live("change", function () {
    var b = main.cache;
    var a, c;

    if ($(this).prop("checked")) {
        a = b.find("span");
        c = a.metadata({
            type: "attr",
            name: "data"
        });
        c.validate.condition = true;
        a.attr("data", $.toJSON(c));
        $("#field_rule_field_0").change();
        PopulateFormFieldNames();

        $(".form-options-conditions").fadeIn(200);
        $(".form-options-conditions").show();
        $("#field_action_type").change();
        $("#field_logic_type").change();
  
    } else {
        a = b.find("span");
        c = a.metadata({
            type: "attr",
            name: "data"
        });
        delete c.validate.condition;
        a.attr("data", $.toJSON(c));
        $(".form-options-conditions").fadeIn(200);
        $(".form-options-conditions").hide();
    }
});

function PopulateFormFieldNames() {

    $(".field_rule_field option").remove();
    $("div.row").each(function (i, e) {

        if ($(this).find(":text").length > 0) {
            $(".field_rule_field").append("<option value=" + $(this).find(":text").attr("id") + ">" + $(this).find(":text").attr("id") + "</option>");
        }
        if ($(this).find(":radio").length > 0) {
            $(".field_rule_field").append("<option value=" + $(this).find(":radio").attr("name") + ">" + $(this).find(":radio").attr("name") + "</option>");
        }
        if ($(this).find("select").length > 0) {
            $(".field_rule_field").append("<option value=" + $(this).find("select").attr("name") + ">" + $(this).find("select").attr("name") + "</option>");
        }
        if ($(this).find(":checkbox").length > 0) {
            var name = $(this).find(":checkbox:first").attr("name");
            name = name.substring(0, name.indexOf("[]"));
            $(".field_rule_field").append("<option value=" + name + ">" + name + "</option>");
        }
    });
    
    var b = main.cache;
    var a = b.find("span");
    
    $("div.condition").each(function (i, e) {

        var fieldName = "field-" + i;
       
            if (a.data(fieldName) != undefined) {
            $('#field_rule_field_' + i).val(a.data(fieldName).field);
            $('#field_rule_field_' + i).change();
           
            $('#field_rule_option_' + i).val(a.data(fieldName).option);
            $('#field_rule_option_' + i).change();
           
            $('#field_rule_operator_' + i).val(a.data(fieldName).operator);
            $('#field_rule_operator_' + i).change();
           
        }
    });
}


function GetRuleValues(index, value) {
    var isInput = $("div.row").find("input[name=" + value + "]").attr("type");

    if (isInput == "text") {
        $("select#field_rule_option_" + index).hide();
        $("input#field_rule_option_" + index).show('');
    } else {
        $("input#field_rule_option_" + index).hide();
        $("select#field_rule_option_" + index).show();
        var isSelect = $("div.row").find('select[name="' + value + '"]').is("select");
        var isCheckbox = $("div.row").find('input:checkbox[name*="' + value + '"]').attr("type");
        var isRadio = $("div.row").find('input:radio[name="' + value + '"]').attr("type");

        if (isSelect) {
            $("select#field_rule_option_" + index + " option").remove();
            $("select#field_rule_option_" + index).append($("div.row").find("select[name=" + value + "]").html());
        }
        if (isCheckbox == "checkbox") {
            $("select#field_rule_option_" + index + " option").remove();
            $("div.row").find('input:checkbox[name*="' + value + '"]').each(function (i, element) {

                $("select#field_rule_option_" + index).append('<option value="' + $(element).attr("value") + '">' + $(element).attr("value") + '</option>');
            });
        }
        if (isRadio == "radio") {
            $("select#field_rule_option_" + index + " option").remove();
            $("div.row").find("input:radio[name=" + value + "]").each(function (i, element) {

                $("select#field_rule_option_" + index).append('<option value="' + $(element).attr("value") + '">' + $(element).attr("value") + '</option>');
            });
        }
    }
    SetRuleProperty(index, "field", value);
}

function SetRuleProperty(index, name, value) {
    var d = main.cache;
    var a = d.find("span");
    var e = 'field-' + index;

    if ($(a).data(e) == null) {
        $(a).data(e, { id: 'field_rule_' + name + '_' + index, operator: 1, option: 1, field: 1 });
    }

   // var f = $(a).data(e);

    switch (name){
        case "field":
            $(a).data(e).field = value; 
        break;
        case "operator":
            $(a).data(e).operator = value;   
        break;
    case "option":
        $(a).data(e).option = value;

        break;
}
}

$("#field_action_type").live("change", function (e) {
    var d = main.cache;
    var a = d.find("span");
  

    a.data("action",$("#field_action_type :selected").text());
    
});

$("#field_logic_type").live("change", function (e) {
    var d = main.cache;
    var a = d.find("span");
   

    a.data("logic",$("#field_logic_type :selected").text());
   
});

$(".condition a, .icon-plus").live("click", function (e) {
    var d = main.cache;
    var a = d.find("span");
    var f = a.metadata({
        type: "attr",
        name: "data"
    });

    if (e.target.id == 'plus' || $(this).attr("class") == 'icon-plus') {
        var c = $("div.condition").length;
        f.validate.conditions = c;
        a.attr("data", $.toJSON(f));
        var d = '<div class="condition"><select id="field_rule_field_' + c + '" style="width:100px;" class="field_rule_field" onload="jQuery(this).trigger("change");" onchange="GetRuleValues(' + c + ',jQuery(this).val());">' + $("#field_rule_field").html() + '</select> ';
        d += '<select id="field_rule_operator_' + c + '"  style="width:110px;" onchange="SetRuleProperty(' + c + ',\'operator\',jQuery(this).val());"><option value="is" selected="selected">is</option><option value="isnot">is not</option><option value="&gt;">greater than</option><option value="&lt;">less than</option><option value="contains">contains</option><option value="starts_with">starts with</option><option value="ends_with">ends with</option></select> ';
        d += '<select style="width:120px;" id="field_rule_option_' + c + '" display="none" onchange="SetRuleProperty(' + c + ',\'option\',jQuery(this).val());"></select><input id="field_rule_option_' + c + '" class="field_rule_value" value="" placeholder="Enter a value" style="display:none;height:15px;width:105px;" onkeyup="SetRuleProperty(' + c + ',\'option\',jQuery(this).val());"/>';
        d += '<a class="btn mini" id="plus" href=# style="vertical-align:top;"><i class="icon-plus"></i></a> <a class="btn mini" id="minus" href=# style="vertical-align:top;"><i class="icon-minus"></i></a></div>'
        $(".form-options-conditions").append(d);
        $("#field_rule_field_"+ c).change();
        PopulateFormFieldNames();
    }

    if (this.id == 'minus') {
        $(this).closest(".condition").remove();
        var d = main.cache;
        var a = d.find("span");
        var e = 'field-' + index;
        (a).removeData(e);
    }
    

});

$("#form-options-pattern-checkbox").live("change", function () {
    var b = main.cache;
    var a, c;
    if ($(this).prop("checked")) {
        a = b.find("span");
        c = a.metadata({
            type: "attr",
            name: "data"
        });
        c.validate.pattern = "[A-Z]";
        c.validate.messages.pattern = "Invalid format.";
        a.attr("data", $.toJSON(c));
        $(this).parent().find(".form-options-pattern-more-options").fadeIn(200)
    } else {
        a = b.find("span");
        c = a.metadata({
            type: "attr",
            name: "data"
        });
        delete c.validate.pattern;
        delete c.validate.messages.pattern;
        a.attr("data", $.toJSON(c));
        $(this).parent().find(".form-options-pattern-more-options").fadeOut(200)
    }
});

$("#form-options-pattern-message").live("keyup", function () {
    var d = $(this).val();
    var b = main.cache;
    var a = b.find("input,select,textarea").parent();
    var c = a.metadata({
        type: "attr",
        name: "data"
    });
    if (c.validate !== undefined) {
        c.validate.messages.pattern = d
    }
    a.attr("data", $.toJSON(c))
});
$("#form-options-pattern-pattern").live("keyup", function () {
    var b = $(this).val();
    var c = main.cache;
    var a = c.find("input,select,textarea").parent();
    var d = a.metadata({
        type: "attr",
        name: "data"
    });
    if (d.validate !== undefined) {
        d.validate.pattern = b
    }
    a.attr("data", $.toJSON(d))
});
$(".form-options-more").live("keyup", function () {
    main.reloadElementOptions()
});

function updateMinMax(g, f, c) {
    var d = main.cache;
    var a = d.find("span");
    var e = a.metadata({
        type: "attr",
        name: "data"
    });
    var b = a.find("input");
    e.validate.format = f;
    if (f == "characters" && c == "min") {
        g.length <= 0 ? delete e.validate.min : e.validate.min = g;
        
    } else {
        if (f == "characters" && c == "max") {
            g.length <= 0 ? delete e.validate.max : e.validate.max = g;
           
        } else {
            if (f == "words" && c == "min") {
                g.length <= 0 ? delete e.validate.min : e.validate.min = g;
               
            } else {
                if (f == "words" && c == "max") {
                    g.length <= 0 ? delete e.validate.max : e.validate.max = g;
                  
                } else {
                    if (f == undefined && c == "min" && b != undefined && b.attr("type") == "checkbox") {
                        g.length <= 0 ? delete e.validate.min : e.validate.min = g;
                        e.validate.messages.min = ("Please select atleast {num} options").replace(/{num}/, g)
                    } else {
                        if (f == undefined && c == "max" && b != undefined && b.attr("type") == "checkbox") {
                            g.length <= 0 ? delete e.validate.max : e.validate.max = g;
                            e.validate.messages.max = ("Please select a maximum of {num} options").replace(/{num}/, g)
                        }
                    }
                }
            }
        }
    }
    a.attr("data", $.toJSON(e))
}
function adjustContainerHeight() {
    var b = $("#dynamic-form").height() + 75;
    var a = $("#left-column").height() + parseInt($("#left-column").css("top").replace("px", "")) - 50;
   // $("#left-column .tabbable ").css("margin-top", parseInt($("#main-column").height() - 300));
    if (b > a) {
        $("#main-column").css("height", (b) + "px")
    } else {
        $("#main-column").css("height", (a) + "px")
    }
}
$("#form-options-range-min").live("keyup", function () {
    if (isNaN($(this).val())) {
        $(this).val($(this).val().replace(/[^0-9]/g, ""))
    }
    var a = $(this).val();
    var b = $("#form-options-range-format").val();
    updateMinMax(a, b, "min")
});
$("#form-options-range-max").live("keyup", function () {
    if (isNaN($(this).val())) {
        $(this).val($(this).val().replace(/[^0-9]/g, ""))
    }
    var a = $(this).val();
    var b = $("#form-options-range-format").val();
    updateMinMax(a, b, "max")
});
$("#form-options-range-minnum").live("keyup", function () {
    var c = main.cache;
    if (isNaN($(this).val())) {
        $(this).val($(this).val().replace(/[^0-9]/g, ""))
    }
    var b = $(this).val();
    var a = c.find("span");
    var d = a.metadata({
        type: "attr",
        name: "data"
    });
    if (b.length <= 0) {
        delete d.validate.min
    } else {
        d.validate.min = b
    }
    a.attr("data", $.toJSON(d))
});
$("#form-options-range-maxnum").live("keyup", function () {
    var c = main.cache;
    if (isNaN($(this).val())) {
        $(this).val($(this).val().replace(/[^0-9]/g, ""))
    }
    var b = $(this).val();
    var a = c.find("span");
    var d = a.metadata({
        type: "attr",
        name: "data"
    });
    if (b.length <= 0) {
        delete d.validate.max
    } else {
        d.validate.max = b
    }
    a.attr("data", $.toJSON(d))
});
$("#form-options-range-format").live("change", function () {
    var c = $(this).val();
    var b = $("#form-options-range-min").val();
    var a = $("#form-options-range-max").val();
    if (b.length > 0) {
        updateMinMax(b, c, "min")
    }
    if (a.length > 0) {
        updateMinMax(a, c, "max")
    }
});
$("#form-options-filetypes").live("keyup", function () {
    var b = main.cache;
    var d = $(this).val();
    var a = b.find("span");
    var c = a.metadata({
        type: "attr",
        name: "data"
    });
    if (d.length <= 0) {
        delete c.validate.accept
    } else {
        c.validate.accept = d
    }
    c.validate.messages.accept = "Please upload only files of type ";
    c.validate.messages.accept += d.split("|") + ".";
    a.attr("data", $.toJSON(c))
});
$("#form-options-filesize").live("keyup", function () {
    var b = main.cache;
    var d = $(this).val();
    var a = b.find("span");
    var c = a.metadata({
        type: "attr",
        name: "data"
    });
    if (d.length <= 0) {
        c.validate.filesize = Math.round(1024 * 1024)
    } else {
        c.validate.filesize = Math.round(d * 1024 * 1024)
    }
    c.validate.messages.filesize = "Filesize should not exceed ";
    c.validate.messages.filesize += d + " MB.";
    a.attr("data", $.toJSON(c))
});
$("#dialog-box").on("click", "div.row", function (a) {
    return false
});
$("#main-column").on("click", "a.delete-element", function (a) {
    a.preventDefault();
    a.stopImmediatePropagation();
    $(this).parent().fadeOut(100, function () {
        $(this).remove();
        if ($("#dynamic-form div.row").length === 0) {
            $("#dynamic-form").html('<div id="no-fields" class="alert-info"><h3>Your Form is Empty!</h3><p>This is a live preview of your form. Currently the form is empty as you have not added any fields. Click a button in the "Form Fields" tab on the left to add a field and start building your form!</p></div>');
            $("#element-options").html("<p>Select or Add an element<p>");
            $("#left-column").tabs("option", "selected", 0)
        } else {
            $("#dynamic-form div.row:first").trigger("click")
        }
    });
    return false
});
$("#main-column").on("click", "div.row", function (b) {
    b.stopImmediatePropagation();
    var a = $(this);
    $("div.row").removeClass("current");
    $("div.row").find("a.delete-element").remove();
    $("#form-name").css({
        "background-color": "#FFF",
        "box-shadow": "none"
    });
    a.addClass("current");
    a.removeClass("selected");
    main.showOptions(a);
    a.find("a.delete-element").remove();
    a.append('<a class="delete-element" href="#"><span class="close-link-span" style="min-height:0px;">delete</span></a>');
    return false
});
$("#main-column").on("hover", "div.row", function (b) {
    b.stopImmediatePropagation();
    var a = $(this);
    if (b.type === "mouseenter" && !a.hasClass("current")) {
        $("div.row").removeClass("selected");
        a.addClass("selected");
        $("div.row").each(function () {
            if (!$(this).hasClass("current")) {
                $(this).find("a.delete-element").remove()
            }
        });
        a.find("a.delete-element").remove();
        a.append('<a class="delete-element" href="#"><span class="close-link-span" style="min-height:0px;">delete</span></a>')
    } else {
        if (b.type === "mouseleave") {
            a.removeClass("selected");
            if (!a.hasClass("current")) {
                a.find("a.delete-element").remove()
            }
        }
    }
    return false
});
$("#main-column").on("hover", "#form-name", function (b) {
    b.stopImmediatePropagation();
    var a = $(this);
    if (b.type === "mouseenter") {
        a.css({
            border: "1px dashed #000",
            margin: "7px 14px"
        })
    } else {
        if (b.type === "mouseleave") {
            a.css({
                border: "none",
                "border-bottom": "1px solid #EFEFEF",
                margin: "8px 15px"
            })
        }
    }
    return false
});

$("#main-column").on("click", "#form-name", function (a) {
    a.stopImmediatePropagation;
    $('#collapse_1').collapse('show');
    $("div.row").removeClass("selected").removeClass("current").find("a.delete-element").remove();
    $(this).css({
        "background-color": "#DFEFFC",
        "box-shadow": "0 1px 3px rgba(0, 0, 0, 0.25)"
    });
    $('#element-options').hide();
    $('#form-options-formname').focus();
    $('#left-column li:eq(2) a').tab('show')
    $("#left-column").animate({
        top: 85
    }, 500);
    return false
});

$("#element-options").on("click", "a.delete-option", function (a) {
    a.preventDefault();
    $(this).parent().fadeOut(200, function () {
        $(this).remove();
        main.reloadElementOptions()
    });
    return false
});
$("a.add-form-option").live("click", function (b) {
    b.preventDefault();
    var a = $("#element-options>div>input.form-options-more").length;
    $("#form-options-more-add").before($(main.addOption("Option " + (a + 1))).fadeIn(200, function () {
        main.reloadElementOptions()
    }));
    return false
});
$("#form-options").on("keyup", "#form-options-formname", function () {
    var a = $(this).val();
    $("#main-column h1").html(a)
});
$("#form-options").on("keyup", "#form-options-url", function () {
    var a = $(this).val();
    $("#main-column #form-id").attr("value", a)
});
$("#form-options").on("change", "#form-options-type", function () {
    var a = $(this).val();
    $("#main-column form").attr("method", a)
});
$(function () {
    $("#form-options-formname").val($("#main-column h1").html());
    $("#form-options-url").val($("#main-column form").attr("action"))
});
$("a.preview").click(function (c) {
    c.preventDefault();
    c.stopImmediatePropagation();
    if ($("#main-column div.row").length <= 0) {
        $("#error-message").html("<p>Please add at least one form element!</p>");
        $("#error-message").dialog({
            width: "300px",
            modal: true,
            title: "No form elements selected"
        });
        return
    }
    var a = "";
    var b = $("#main-column").html();
    $("#dialog-box").html(b.replace('id="dynamic-form"', 'id="preview_form"'));
    b = $("#dialog-box");
    b.find("h1").css({
        "background-color": "#FFFFFF",
        border: "none",
        margin: "8px 15px"
    });
    b.find("form").removeAttr("id").removeAttr("class").append('<input type="submit" class="button blue" value="Submit" id="submit-form"/>').attr("id", "preview_form");
    b.find(".row").removeClass("selected").removeClass("current").find("a.delete-element").remove();
    $("#dialog-box div.row").each(function () {
        var d = $(this).find("span");
        var f = d.attr("data");
        var e = $(this).find("input:first,textarea,select").attr("data", f);
        e.attr("id", "dialog_box_" + e.attr("id"));
        if (d.attr("class") == "date") {
            a += '$("#' + e.attr("id") + '").datepicker({changeMonth: true,changeYear: true,yearRange: "1900:2012"});'
        } else {
            if (d.attr("class") == "time") {
                a += '$("#' + e.attr("id") + '").timepicker();';
                $("#dialog-box").append($("<script />", {
                    src: "js/jquery.ui.timepicker.js"
                }));
                $("head").append('<link rel="stylesheet" href="css/jquery.ui.timepicker.css" type="text/css" media="all" />');
                jQuery.validator.addMethod("time", function (h, g) {
                    return this.optional(g) || /^([01]\d|2[0-3])(:[0-5]\d){0,2}$/.test(h)
                }, "Please enter a valid time, between 00:00 and 23:59")
            } else {
                if (d.attr("class") == "phone") {
                    jQuery.validator.addMethod("phone", function (g, h) {
                        return this.optional(h) || g.length > 9 && g.match(/^(?:\+?1[-. ]?)?\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/)
                    }, "Please enter a valid phone number")
                } else {
                    if (d.attr("class") == "creditCard") { }
                }
            }
        }
        $(this).find("span").attr("data", "");
        $.metadata.setType("attr", "data");
        $("#preview_form").validate({
            meta: "validate",
            errorPlacement: function (g, h) {
                if (h.attr("type") == "checkbox" || h.attr("type") == "radio") {
                    h.parent().parent().append(g)
                } else {
                    g.insertAfter(h)
                }
            }
        })
    });
    $("#dialog-box").append($("<script />", {
        html: a
    }));
    $("#dialog-box").dialog({
        width: "600px",
        modal: true,
        title: "Form Preview",
        close: function (d, e) {
            $("#dialog-box").html("")
        }
    })
});
$("a.download").click(function (d) {
    d.preventDefault();
    d.stopImmediatePropagation();
    if ($("#main-column div.row").length <= 0) {
        $("#error-message").html("<p>Please add at least one form element!</p>");
        $("#error-message").dialog({
            width: "300px",
            modal: true,
            title: "No form elements selected"
        });
        return
    }
    var b = $("#main-column").html();
    $("#dialog-box").html(b);
    b = $("#dialog-box");
    b.find("form").append('<input type="submit" class="button blue" value="Submit" id="submit-form"/>').removeAttr("class");
    b.find(".row").removeClass("selected").removeClass("current").find("a.delete-element").remove();
    var h = {};
    var c = {};
    var f = {};
    b.find("div.row").each(function () {
        var e = $(this).find("span");
        var l = e.attr("data");
        var m = $(this).find("input:first,textarea,select").attr("data", l).attr("name").replace("[", "").replace("]", "");
        c[m] = e.attr("class");
        if (e.attr("class") == "checkBoxGroup" || e.attr("class") == "radioButton" || e.attr("class") == "dropDown") {
            f[m] = [];
            $(this).find("input,option").each(function () {
                f[m].push($(this).val())
            })
        }
        h[m] = $.toJSON(l);
        e.removeAttr("data")
    });
    b.find("h1#form-name").removeAttr("style");
    var a = $("input[name='theme-changer']:checked").attr("id");
    var k = $("#form-options-success-msg").val();
    var g = $("#form-options-email-user").prop("checked") ? {
        to: $("#form-options-email-to").val(),
        cc: $("#form-options-email-cc").val(),
        subject: $("#form-options-email-subject").val()
    } : false;
    if (g != false) {
        if ($("#form-options-email-smtp").prop("checked")) {
            g.smtp = {};
            g.smtp.host = $("#form-options-email-smtphost").val();
            if ($("#form-options-email-smtp-username").val().length > 0 && $("#form-options-email-smtp-password").val().length > 0) {
                g.smtp.username = $("#form-options-email-smtp-username").val();
                g.smtp.password = $("#form-options-email-smtp-password").val()
            }
        }
    }
    var j = $("#form-options-db-savedata").prop("checked") ? {
        host: $("#form-options-db-server").val(),
        username: $("#form-options-db-username").val(),
        password: $("#form-options-db-password").val(),
        dbname: $("#form-options-db-dbname").val(),
        tablename: $("#form-options-db-tablename").val()
    } : false;
    var i = {
        html: b.html(),
        validation: h,
        style: a,
        success: k,
        email: g,
        db: j,
        fields: c,
        allowedValues: f
    };
    b.html("");
    $.ajax({
        url: "form/FormBuilder.php",
        type: "POST",
        data: i,
        success: function (e) {
            e = $.parseJSON(e);
            if (e && e.success) {
                $("#error-message").html('<p>Your Form is created successfully. This is a preview version, hence you cannot download the generated form. However you can take a look at the generated form and the generated AJAX form using the below links</p><li><a class="button1" href="' + e.FileUrl.replace(".zip", "/form.php") + '" target="_blank">Link to the Generated Form</a></li><li><a class="button1" href="' + e.FileUrl.replace(".zip", "/ajax/form.html") + '" target="_blank">Link to the Generated AJAX Form</a></li>');
                $("#error-message").dialog({
                    width: "500px",
                    modal: true,
                    title: "Form Generated!"
                })
            } else {
                $("#error-message").html("<p>An Error occured while trying to download your form. Please try again or contact the admin for further assisstance</p>");
                $("#error-message").dialog({
                    width: "400px",
                    modal: true,
                    title: "Error Occured"
                })
            }
        }
    })
});
$(function () {
    $("#theme-changer-container").buttonset();
    $("#style1").attr("selected", "selected");
    $("#theme-changer-container ").buttonset("refresh");
    $("input[name='theme-changer']").change(function () {
        var a = $(this).attr("id");
        $("link#css-theme").attr("href", "assets/form-css/" + a + ".css")
    });
    $("#form-options a.form-tip").tipsy({
        gravity: "w",
        fade: true
    });
    if ($("#form-options-email-user").prop("checked")) {
        $("#form-options-email-options").show()
    }
});
$("a.delete-option,a.delete-element").live("hover", function (b) {
    b.stopImmediatePropagation();
    var a = $(this);
    if (b.type === "mouseenter") {
        a.addClass("close-link-hover")
    } else {
        if (b.type === "mouseleave") {
            a.removeClass("close-link-hover")
        }
    }
    return false
});
$("#form-options-email-user").change(function () {
    if ($(this).prop("checked")) {
        $("#form-options-email-options").show();
        adjustContainerHeight()
    } else {
        $("#form-options-email-options").hide();
        adjustContainerHeight()
    }
});
$("#form-options-email-smtp").change(function () {
    if ($(this).prop("checked")) {
        $("#form-options-email-smtpserver").show();
        adjustContainerHeight()
    } else {
        $("#form-options-email-smtpserver").hide();
        adjustContainerHeight()
    }
});
$("#form-options-db-savedata").change(function () {
    if ($(this).prop("checked")) {
        $("#form-options-db-options").show();
        adjustContainerHeight()
    } else {
        $("#form-options-db-options").hide();
        adjustContainerHeight()
    }
});
$('#left-column li:eq(0) a, #left-column li:eq(2) a ').click(function () {
    $('#element-options').hide();
});
$('#left-column li:eq(1) a').click(function () {
    $('#element-options').fadeIn(200);
});
$('#collapse_1').collapse('show');

$('#form-save-btn').on("click", function () {
    if ($("div.row").length > 0) {
        $.post("/newform.aspx", getFormFields())
        alert("Form Sent");
        //window.location.href = "/forms.aspx";
    } else {
        alert("You must add at least one field to your from before you can save it.");
    }
});

$('#form-preview-btn').on("click", function () {
    if ($("div.row").length > 0) {
        //$.post("/newform.aspx", getFormFields());
        
        //window.location.href = "/forms.aspx";
    } else {
        alert("You must add at least one field to your from before you can preview it.");
    }
});

function getFormFields () {
    var q = '?form_name=' + $("#form-options-formname").val();
    var type = "";
    var name = "";
    var elementSpan = "";
    $("#dynamic-form div.row").each(function (index, element) {
        fType = $(element).find("span:first-of-type:not(.close-link-span)").attr("class");
        fName = $(element).find("textarea,input,select,div").last().attr("name");
        if (index > 0) { q += '&'; }
        q += '&fType_' + index + '=' + fType;
        q += '&fID_' + index + '=' + fName;
        q += '&fLabel_' + index + '=' + $(element).find("label:first").text();
        elementSpan = $(element).find("span:first-of-type:not(.close-link-span)");
        var a = elementSpan.metadata({
            type: "attr",
            name: "data"
        });
        q += '&fReq_' + index + '=' + a.validate.required;
        if (a.validate.required) {
            q += '&fReqMessage_' + index + '=' + a.validate.messages.required;
        }

        switch (fType) {
            case "dropDown":
                if ($(element).find('.' + fType + ' option').length != 0) {
                    $(element).find('.' + fType + ' option').each(function (i, e) {
                        q += '&fOpt_' + index + '_' + i + '=' + $(this).text() + '';
                    });
                }
                break;
            case "radioButton":
                if ($(element).find('.' + fType + ' [type="radio"]').length != 0) {
                    $(element).find('.' + fType + ' [type="radio"]').each(function (i, e) {
                        q += '&fBtn_' + index + '_' + i + '=' + $(e).attr("value");
                    });
                }
                break;
            case "checkBoxGroup":
                if ($(element).find('.' + fType + ' [type="checkbox"]').length != 0) {
                    $(element).find('.' + fType + ' [type="checkbox"]').each(function (i, e) {
                        q += '&fChkbox_name_' + index + "_" + i + '=' + $(this).attr("name") + '';
                        q += '&fChkbox_val_' + index + "_" + i + '=' + $(this).attr("value") + '';
                    });
                }
                break;
            case "number":
                if (a.validate.min != undefined) { q += '&fMin_' + index + '=' + a.validate.min; }
                if (a.validate.max != undefined) { q += '&fMax_' + index + '=' + a.validate.max; }
                if (a.validate.format != undefined) { q += '&fFormat_' + index + '=' + a.validate.format; }
                if (a.validate.messages.pattern != undefined) { q += '&fRegExp_' + index + '=true'; q += '&fPattern_' + index + '=' + a.validate.messages.pattern; }
                if (a.validate.pattern != undefined) { q += '&fMessage_' + index + '=' + a.validate.pattern; }
                break;
            case "email":
                if (a.validate.min != undefined) { q += '&fMin_' + index + '=' + a.validate.min; }
                if (a.validate.max != undefined) { q += '&fMax_' + index + '=' + a.validate.max; }
                if (a.validate.format != undefined) { q += '&fFormat_' + index + '=' + a.validate.format; }
                if (a.validate.messages.pattern != undefined) { q += '&fRegExp_' + index + '=true'; q += '&fPattern_' + index + '=' + a.validate.messages.pattern; }
                if (a.validate.pattern != undefined) { q += '&fMessage_' + index + '=' + a.validate.pattern; }
                break;
            case "url":
                if (a.validate.min != undefined) { q += '&fMin_' + index + '=' + a.validate.min; }
                if (a.validate.max != undefined) { q += '&fMax_' + index + '=' + a.validate.max; }
                if (a.validate.format != undefined) { q += '&fFormat_' + index + '=' + a.validate.format; }
                if (a.validate.messages.pattern != undefined) { q += '&fRegExp_' + index + '=true'; q += '&fPattern_' + index + '=' + a.validate.messages.pattern; }
                if (a.validate.pattern != undefined) { q += '&fMessage_' + index + '=' + a.validate.pattern; }

                break;

            case "textField":
                if (a.validate.min != undefined) { q += '&fMin_' + index + '=' + a.validate.min; }
                if (a.validate.max != undefined) { q += '&fMax_' + index + '=' + a.validate.max; }
                if (a.validate.format != undefined) { q += '&fFormat_' + index + '=' + a.validate.format; }
                if (a.validate.messages.pattern != undefined) { q += '&fRegExp_' + index + '=true'; q += '&fPattern_' + index + '=' + a.validate.messages.pattern; }
                if (a.validate.pattern != undefined) { q += '&fMessage_' + index + '=' + a.validate.pattern; }

                if (a.validate.condition == true) {
                    q += '&fConAction_' + index + '=' + elementSpan.data("action");
                    q += '&fConLogic_' + index + '=' + elementSpan.data("logic");
                }
                if (a.validate.conditions != undefined) {
                        
                    for (var i = 0; i < elementSpan.data.length; i++) {
                        q += '&fConID_' + index + '_' + i + '=' + elementSpan.data("field-" + i).id;
                        q += '&fConField_' + index + '_' + i + '=' + elementSpan.data("field-" + i).field;
                        q += '&fConOperator_' + index + '_' + i + '=' + elementSpan.data("field-" + i).operator;
                        q += '&fConOption_' + index + '_' + i + '=' + elementSpan.data("field-" + i).option;
                    }
                }

                break;
        }
    });

    return(q);
}