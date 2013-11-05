jQuery.validator.addMethod("minWords", function (b, a, c) {
    return !$(a).val() || $(a).val().split(/[\s\.\?]+/).length >= c
}, "Please enter at least {0} words.");
jQuery.validator.addMethod("maxWords", function (b, a, c) {
    return !$(a).val() || $(a).val().split(/[\s\.\?]+/).length <= c
}, "Please enter no more than {0} words.");
jQuery.validator.addMethod("filesize", function (b, a, c) {
    return this.optional(a) || (a.files[0].size <= c)
});
$(".stepSection").click(function (b) {
    b.preventDefault();
    var a = $(this).attr("class").replace(" flow-element button1", "");
    main.addStep(main.lookUp(a));
    
    adjustContainerHeight();
    

});

$(function () {
  //  $("#form-tabs a").on("shown", function (e) {
    //    adjustContainerHeight()
   // });
    /*$("#flow-elements li").draggable({
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
    c.find("input,select,textarea").attr("id", d).attr("name", d);
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
    a.find("input,select,textarea").attr("id", b).attr("name", b);
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
        $(".form-options-conditions").fadeIn(200);
        $(".form-options-conditions").show();

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
$(".condition a, .icon-plus").live("click", function (e) {
    if (e.target.id == 'plus' || $(this).attr("class") == 'icon-plus') {
        var d = '<div class="condition"><select  id="field_rule_field_0" style="width:100px;" onchange=" "><option value="2">Untitled</option></select> ';
        d += '<select id="field_rule_operator_0" onchange="" style="width:110px;"><option value="is" selected="selected">is</option><option value="isnot">is not</option><option value="&gt;">greater than</option><option value="&lt;">less than</option><option value="contains">contains</option><option value="starts_with">starts with</option><option value="ends_with">ends with</option></select> ';
        d += '<select style="width:120px;" id="field_rule_value_0"><option value="First Choice">First Choice</option><option value="Second Choice">Second Choice</option><option value="Third Choice">Third Choice</option></select> ';
        d += '<a class="btn mini" id="plus" href=# style="vertical-align:top;"><i class="icon-plus"></i></a> <a class="btn mini" id="minus" href=# style="vertical-align:top;"><i class="icon-minus"></i></a></div>'
        $(".form-options-conditions").append(d);
    }

    if (this.id == 'minus') {
        $(this).closest(".condition").remove();
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
    if (f == "characters" && c == "min") {
        g.length <= 0 ? delete e.validate.minlength : e.validate.minlength = g;
        delete e.validate.minWords
    } else {
        if (f == "characters" && c == "max") {
            g.length <= 0 ? delete e.validate.maxlength : e.validate.maxlength = g;
            delete e.validate.maxWords
        } else {
            if (f == "words" && c == "min") {
                g.length <= 0 ? delete e.validate.minWords : e.validate.minWords = g;
                delete e.validate.minlength
            } else {
                if (f == "words" && c == "max") {
                    g.length <= 0 ? delete e.validate.maxWords : e.validate.maxWords = g;
                    delete e.validate.maxlength
                } else {
                    if (f == undefined && c == "min" && b != undefined && b.attr("type") == "checkbox") {
                        g.length <= 0 ? delete e.validate.minlength : e.validate.minlength = g;
                        e.validate.messages.minlength = ("Please select atleast {num} options").replace(/{num}/, g)
                    } else {
                        if (f == undefined && c == "max" && b != undefined && b.attr("type") == "checkbox") {
                            g.length <= 0 ? delete e.validate.maxlength : e.validate.maxlength = g;
                            e.validate.messages.maxlength = ("Please select a maximum of {num} options").replace(/{num}/, g)
                        }
                    }
                }
            }
        }
    }
    a.attr("data", $.toJSON(e))
}

function adjustContainerHeight() {

    h = $("#main-column").height() + 250;
    $("#main-column").css("height", h)

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
        if ($("#dynamic-flow div.row").length === 0) {
            $("#dynamic-flow").html('<div id="no-fields" class="alert-info"><h3>Your Flow is Empty!</h3><p>This is a live preview of your flow. Currently the flow is empty as you have not added any items. Click a button in the "Flow Items" tab on the left to add a field and start building your form!</p></div>');
            $("#element-options").html("<p>Select or Add an element<p>");
            $("#left-column").tabs("option", "selected", 0)
        } else {
            $("#dynamic-flow div.row:first").trigger("click")
        }
    });
    return false
});

$(".stepActor, .in_action, .and, .or").click(function (b) {
    b.preventDefault();
    var a = $(this).attr("class").replace(" flow-element button1", "");

    main.addElement(main.lookUp(a));

    if ($("div.currentStep .stepButton").length % 4 == 0) {
        h = $("div.currentStep").height() + 40;
        $("div.currentStep").css("height", h);
    }
    if ($("div.currentStep .stepButton").length > 4) {
        $("div.currentStep .stepButton").css("margin-top", "5px");
       
    }

});

$("#main-column").on("click", ".icon-remove", function (b) {

    var a = main.cache;
    a.removeData();
    $(this).parents(".stepButton").remove();
    if ($("div.currentStep .stepButton").length < 4) {

        $("div.currentStep").css("height", 55);
        $("div.currentStep .stepButton").css("margin-top", "0px");

    }
    $("#element-options").html("<p>Select or Add an element<p>");
});

$("#main-column").on("click", "div.flow-step-if,div.flow-step-then", function (b) {
    b.stopImmediatePropagation();
    var a = $(this);

    $("div.flow-step-then.currentStep").removeClass("currentStep");
    $("div.flow-step-if.currentStep").removeClass("currentStep");
    a.addClass("currentStep");
    $("div.row").removeClass("current");
    $(this).parents("div.row").addClass("current");
    $('#element-options').hide();
   $('#flow-tabs li:eq(0) a').tab('show');
});

$("#main-column").on("click",".btn-text", function (b) {

    b.stopImmediatePropagation();
    var a = $(this);
   
    main.showOptions(a.parents("div:first"));
});

$("#flow-options-type").live("change", function (b) {
    // b.stopImmediatePropagation();
    var a = main.cache;
    var b = $("#flow-options-type :selected").val();
    if (b == "person") {
        $("#flow-options-role").hide();
        $("#flow-options-person").show();
        $("#flow-options-group").hide();
    } else if (b == "role") {
        $("#flow-options-role").show();
        $("#flow-options-person").hide();
        $("#flow-options-group").hide();

    } else if (b == "group"){
        $("#flow-options-role").hide();
        $("#flow-options-person").hide();
        $("#flow-options-group").show();
    }

    a.removeData();
    a.data("type", b);
    

});

$("#flow-options-person").live("change", function (b) {
    // b.stopImmediatePropagation();
    var a = main.cache;
    var b = $("#flow-options-person :selected").val();
    if (b != "select") {
        a.find(".btn-text").text($("#flow-options-person :selected").val().substr(0, 40));
    }
    a.data("person", b);

    
});

$("#flow-options-role").live("change", function (b) {
    // b.stopImmediatePropagation();
    var a = main.cache;
    var b = $("#flow-options-role :selected").val();
    if (b != "select") {
        a.find(".btn-text").text($("#flow-options-role :selected").val().substr(0, 40));
    }
    a.data("role", b);
});

$("#flow-options-group").live("change", function (b) {
    // b.stopImmediatePropagation();
    var a = main.cache;
    var b = $("#flow-options-group :selected").val();
    if (b != "select") {
        a.find(".btn-text").text($("#flow-options-group :selected").val().substr(0, 40));
    }
    a.data("role", b);
});

$("#flow-options-action-type").live("change", function (b) {
    // b.stopImmediatePropagation();
    var a = main.cache;
    var b = $("#flow-options-action-type :selected").val();
    $("#flow-options-remind").datepicker();
    if (b == "remind") {
        a.find(".btn-text").text($("#flow-options-action-type :selected").val().substr(0, 40));
        $("#flow-option-remind-container").show();
        $("#flow-options-submit").hide();
    } else if (b == "notify") {
        a.find(".btn-text").text($("#flow-options-action-type :selected").val().substr(0, 40));
        $("#flow-option-remind-container").hide();
        $("#flow-options-submit").hide();
    } else if (b == "submit") {
        a.find(".btn-text").text($("#flow-options-action-type :selected").val().substr(0, 40));
        $("#flow-option-remind-container").hide();
        $("#flow-options-submit").show();
    }

    a.data("role", b);
});


$("#flow-options-submit").live("change", function (b) {
    var a = main.cache;
    var b = $("#flow-options-submit :selected").text();
    a.find(".btn-text").text("submits " + b.substr(0, 40));
    a.data("form", b);
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
    a.addClass("current ");
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
    $("#main-column form").attr("action", a)
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
    $("#dialog-box").html(b.replace('id="dynamic-flow"', 'id="preview_form"'));
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


