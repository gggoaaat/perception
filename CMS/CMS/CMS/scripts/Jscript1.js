jQuery.validator.addMethod("minWords", function (b, a, c) {
    return !$(a).val() || $(a).val().split(/[\s\.\?]+/).length >= c
}, "Please enter at least {0} words.");
jQuery.validator.addMethod("maxWords", function (b, a, c) {
    return !$(a).val() || $(a).val().split(/[\s\.\?]+/).length <= c
}, "Please enter no more than {0} words.");
jQuery.validator.addMethod("filesize", function (b, a, c) {
    return this.optional(a) || (a.files[0].size <= c)
});
$(".form-element").click(function (b) {
    b.preventDefault();
    var a = $(this).attr("class").replace(" form-element button1", "");
    main.addElement(main.lookUp(a));
    adjustContainerHeight()
});
$(function () {
    $("#left-column").tabs({
        show: function (a, b) {
            adjustContainerHeight()
        }
    });
    $("#form-elements li").draggable({
        revert: true
    })
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
    var b = $("#dynamic-form").height() + 50;
    var a = $("#left-column").height() + parseInt($("#left-column").css("top").replace("px", "")) - 50;
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
    var...ethod("phone", function (g, h) {
        return this.optional(h) || g.length > 9 && g.match(/^(?:\+?1[-. ]?)?\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/)
    }, "Please enter a valid phone number")
} else {
    if (d.attr("class") == "creditCard") {}
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
        $("#error-message").html("<p>Please add atleast one form element!</p>");
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
    $("#style1").attr("checked", "checked");
    $("#theme-changer-container ").buttonset("refresh");
    $("input[name='theme-changer']").change(function () {
        var a = $(this).attr("id");
        $("link#css-theme").attr("href", "css/" + a + ".css")
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