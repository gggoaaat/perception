var main = {
    options: {
        mainDiv: "main-column",
        optionsDiv: "element-options",
        leftDiv: "left-column"
    },
    cache: null,
    addElement: function (e) {
        var d = this.hasOwnProperty(e) ? this[e]() : null;
        var c = $(d);
        var a = c.find("span");
        var f = a.metadata({
            type: "attr",
            name: "data"
        });
        a.attr("data", $.toJSON(f));
        $("#" + this.options.mainDiv + " form").find("#no-fields").remove();
        $("#" + this.options.mainDiv + " form").append(c.fadeIn(400));
        if (d != null) {
            this.showOptions(c)
        }
        var b = parseInt($("#left-column").css("top").replace("px", "")) + parseInt($("#left-column").height() + 250);

        //  $(".tabbable").affix({
        //    offset: $(".tabbable").position()
        //  })

        //  $(".tabbable").css("width", "400px");
        // $("#left-column").css("margin-left", "450px");
        $("form").sortable({
            items: "div.row",
            revert: true,
            containment: '#dynamic-form',
            scroll: true
        });

        $("div.row").removeClass("current").find("a.delete-element").remove();
        $("#form-name").css({
            "background-color": "#FFF",
            "box-shadow": "none"
        });

        c.addClass("current").append('<a class="delete-element" href="#"><span class="close" style="min-height:0px;">delete</span></a>');
        $("#element-options a.form-tip").tipsy({
            gravity: "w",
            fade: true
        });
        //  $("html, body").animate({
        //     scrollTop: $(document).height()
        //  }, 1000)


        var height = $('#main-column')[0].scrollHeight;
        $('#main-column').scrollTop(height);
       
        $('#main-column').slimScroll({
            height: '500px',
            railVisible: true,
            alwaysVisible: true
        });
    },
    removeElement: function (a) {
        $("#" + a).parent().remove()
    },
    editElement: function (a) { },
    showOptions: function (c) {
        this.cache = c;
        var a = c.children("span");

        var j = a.attr("class").replace(" required", "");
        var d = '<label>Label <a class="form-tip" href="#" original-title="A field\'s label is the most direct way of telling your user what kind of data  should be entered into a particular field. Field labels are usually just one or two words,  but can also be a question.">(?)</a></label>';
        var f = c.children("label");
        d += '<input type="text" id="form-options-label" value="' + f.html().replace('<div class="rqrd">*</div>', "") + '"/>';
        d += '<label>ID <a class="form-tip" href="#" original-title="The name of the form field which you use at the server end to access the data submitted to the server.">(?)</a></label>';

        switch (j) {
            case "dropDown":
                f = c.find("label");
                d += '<input type="text" id="form-options-name" value="' + main.NameToProper(f.html().replace('<div class="rqrd">*</div>', "")) + '"/>';
                a.find("option").each(function () {
                    d += main.addOption($(this).html())
                });
                d += '<div id="form-options-more-add"><a href="#" class="add-form-option">Add</a></div>';
                d += '<div id="form-options-check"><input type="checkbox" class="checkbox" id="form-options-checkbox" />Required <a class="form-tip" href="#" original-title="If you want to make sure a user fills out a field, ensure the required attribute is checked.">(?)</a></div>';
                break;
            case "radioButton":
                f = c.find("label:first");
                d += '<input type="text" id="form-options-name" value="' + main.NameToProper(f.html().replace('<div class="rqrd">*</div>', "")) + '"/>';
                a.find("input").each(function () {
                    d += main.addOption($(this).val())
                });
                d += '<div id="form-options-more-add"><a href="#" class="add-form-option">Add</a></div>';
                d += '<div id="form-options-check"><input type="checkbox" class="checkbox" id="form-options-checkbox" />Required <a class="form-tip" href="#" original-title="If you want to make sure a user fills out a field, ensure the required attribute is checked.">(?)</a></div>';
                break;
            case "checkBoxGroup":
                f = c.find("label");
                d += '<input type="text" id="form-options-name" value="' + main.NameToProper(f.html().replace('<div class="rqrd">*</div>', "")) + '"/>';
                a.find("input").each(function () {
                    d += main.addOption($(this).val())
                });
                d += '<div id="form-options-more-add"><a href="#" class="add-form-option">Add</a></div>';
                d += '<div id="form-options-check"><input type="checkbox" class="checkbox" id="form-options-checkbox" />Required <a class="form-tip" href="#" original-title="If you want to make sure a user fills out a field, ensure the required attribute is checked.">(?)</a></div>';
                break;
            case "number":
                f = c.find("input,textarea,select");
                d += '<input type="text" id="form-options-name" value="' + main.NameToProper(f.attr("name")) + '"/>';
                d += '<div id="form-options-check"><input type="checkbox" class="checkbox" id="form-options-checkbox" />Required <a class="form-tip" href="#" original-title="If you want to make sure a user fills out a field, ensure the required attribute is checked.">(?)</a></div>';
                d += '<div class="form-options-range"><label>Min <a class="form-tip" href="#" original-title="The minimum number the user should enter">(?)</a></label><input type="text" name="form-options-range-minnum" id="form-options-range-minnum" /></div><div class="form-options-range"><label>Max <a class="form-tip" href="#" original-title="The maximum number the user can enter">(?)</a></label><input type="text" name="form-options-range-maxnum" id="form-options-range-maxnum" /></div>';
                break;
            case "email":
                f = c.find("input,textarea,select");
                d += '<input type="text" id="form-options-name" value="' + main.NameToProper(f.attr("name")) + '"/>';
                d += '<div id="form-options-check"><input type="checkbox" class="checkbox" id="form-options-checkbox" />Required <a class="form-tip" href="#" original-title="If you want to make sure a user fills out a field, ensure the required attribute is checked.">(?)</a></div>';
                d += '<div class="form-options-range"><label>Min <a class="form-tip" href="#" original-title="The minimum number of characters the user should enter">(?)</a></label><input type="text" name="form-options-range-min" id="form-options-range-min" /></div><div class="form-options-range"><label>Max <a class="form-tip" href="#" original-title="The maximum number of characters the user can enter">(?)</a></label><input type="text" name="form-options-range-max" id="form-options-range-max" /></div>';
                break;
            case "url":
                f = c.find("input,textarea,select");
                d += '<input type="text" id="form-options-name" value="' + main.NameToProper(f.attr("name")) + '"/>';
                d += '<div id="form-options-check"><input type="checkbox" class="checkbox" id="form-options-checkbox" />Required <a class="form-tip" href="#" original-title="If you want to make sure a user fills out a field, ensure the required attribute is checked.">(?)</a></div>';
                d += '<div class="form-options-range"><label>Min <a class="form-tip" href="#" original-title="The minimum number of characters the user should enter">(?)</a></label><input type="text" name="form-options-range-min" id="form-options-range-min" /></div><div class="form-options-range"><label>Max <a class="form-tip" href="#" original-title="The maximum number of characters the user can enter">(?)</a></label><input type="text" name="form-options-range-max" id="form-options-range-max" /></div>';
                break;
            case "date":
                f = c.find("input,textarea,select");
                d += '<input type="text" id="form-options-name" value="' + main.NameToProper(f.attr("name")) + '"/>';
                d += '<div id="form-options-check"><input type="checkbox" class="checkbox" id="form-options-checkbox" />Required <a class="form-tip" href="#" original-title="If you want to make sure a user fills out a field, ensure the required attribute is checked.">(?)</a></div>';
                break;
            case "time":
                f = c.find("input,textarea,select");
                d += '<input type="text" id="form-options-name" value="' + main.NameToProper(f.attr("name")) + '"/>';
                d += '<div id="form-options-check"><input type="checkbox" class="checkbox" id="form-options-checkbox" />Required <a class="form-tip" href="#" original-title="If you want to make sure a user fills out a field, ensure the required attribute is checked.">(?)</a></div>';
                break;
            case "phone":
                f = c.find("input,textarea,select");
                d += '<input type="text" id="form-options-name" value="' + main.NameToProper(f.attr("name")) + '"/>';
                d += '<div id="form-options-check"><input type="checkbox" class="checkbox" id="form-options-checkbox" />Required <a class="form-tip" href="#" original-title="If you want to make sure a user fills out a field, ensure the required attribute is checked.">(?)</a></div>';
                break;
            case "creditCard":
                f = c.find("input,textarea,select");
                d += '<input type="text" id="form-options-name" value="' + main.NameToProper(f.attr("name")) + '"/>';
                d += '<div id="form-options-check"><input type="checkbox" class="checkbox" id="form-options-checkbox" />Required <a class="form-tip" href="#" original-title="If you want to make sure a user fills out a field, ensure the required attribute is checked.">(?)</a></div>';
                break;
            case "fileUpload":
                f = c.find("input");
                d += '<input type="text" id="form-options-name" value="' + main.NameToProper(f.attr("name")) + '"/>';
                d += '<div id="form-options-check"><input type="checkbox" class="checkbox" id="form-options-checkbox" />Required <a class="form-tip" href="#" original-title="If you want to make sure a user fills out a field, ensure the required attribute is checked.">(?)</a></div>';
                d += '<label>Allowed File Types <a class="form-tip" href="#" original-title="Please specify the file types the user can upload, you can enter multiple file types by using the pipe character (|)">(?)</a></label><div><input type="text" name="form-options-filetypes" id="form-options-filetypes" value="png|jpeg|gif"/></div>';
                d += '<label>Max File Size in MB <a class="form-tip" href="#" original-title="The max file size this fied will accept. Please enter the file size in MB. Eg: for 512 KB file - enter this as 0.5 MB">(?)</a></label><div><input type="text" name="form-options-filesize" id="form-options-filesize" /></div>';
                break;
            case "section":
                f = c.find("div");
                d += '<input type="text" id="form-options-name" value="' + main.NameToProper(f.attr("name")) + '"/>';
                break;
            case "pageBreak":
                f = c.find("div");
                d += '<input type="text" id="form-options-name" value="' + main.NameToProper(f.attr("name")) + '"/>';
                break;
            default:
                f = c.find("input,textarea,select");
                d += '<input type="text" id="form-options-name" value="' + main.NameToProper(f.attr("name")) + '"/>';
                d += '<div id="form-options-check"><input type="checkbox" class="checkbox" id="form-options-checkbox" />Required <a class="form-tip" href="#" original-title="If you want to make sure a user fills out a field, ensure the required attribute is checked.">(?)</a></div>';
                d += '<div id="form-options-pattern"><input type="checkbox" class="checkbox" id="form-options-pattern-checkbox" />Regular Expression Pattern <a class="form-tip" href="#" original-title="If checked, the generated field should satisfy the pattern you specify">(?)</a><div class="form-options-pattern-more-options"><label>Pattern</label><input id="form-options-pattern-pattern" value="[A-Z]" /> <label>Error Message</label><input id="form-options-pattern-message" value="Invalid format." /></div></div>';
                d += '<div class="form-options-range"><label>Min <a class="form-tip" href="#" original-title="The minimum number of characters/words the user should enter">(?)</a></label><input type="text" name="form-options-range-min" id="form-options-range-min" /></div><div class="form-options-range"><label>Max <a class="form-tip" href="#" original-title="The maximum number of characters/words the user can enter">(?)</a></label><input type="text" name="form-options-range-max" id="form-options-range-max" /></div><div class="form-options-range-format"><label>Format <a class="form-tip" href="#" original-title="The unit to measure the minimum/maximum - Characters or words">(?)</a></label><select id="form-options-range-format"><option value="characters">Characters</option><option value="words">Words</option></select></div>';
                d += '<div id="form-options-conditional"><input type="checkbox" class="checkbox" id="form-options-conditional-checkbox">Conditional Logic <a class="form-tip" href="#" original-title="Create rules to dynamically display or hide this field based on values from another field.">(?)</a></div>';
                d += '<div class="form-options-conditions"><select id="field_action_type"  style="width:70px;"><option value="show" selected="selected">Show</option><option value="hide">Hide</option></select> ';
                d += 'this field if <select style="width:60px;"  id="field_logic_type" ><option value="all" selected="selected">All</option><option value="any">Any</option></select> ';
                d += 'of the following match: <div class="condition"><select class="field_rule_field" id="field_rule_field_0" style="width:100px;"  onchange="GetRuleValues(0,jQuery(this).val());"></select>';
                d += '<select id="field_rule_operator_0" style="width:110px;" onchange="SetRuleProperty(0,\'operator\',jQuery(this).val());"><option value="is" selected="selected">is</option><option value="isnot">is not</option><option value="&gt;">greater than</option><option value="&lt;">less than</option><option value="contains">contains</option><option value="starts_with">starts with</option><option value="ends_with">ends with</option></select> ';
                d += '<select style="width:120px;" id="field_rule_option_0" onchange="SetRuleProperty(0,\'option\',jQuery(this).val());"  ></select><input id="field_rule_option_0"  value="" placeholder="Enter a value" style="display:none;height:15px;width:105px;" onkeyup="SetRuleProperty(0,\'option\',jQuery(this).val());"/>';
                d += '<a class="btn mini" id="plus" href=# style="vertical-align:top;"><i class="icon-plus"></i></a></div></div>';

                break;
        }



        var i = a.find("input,select,textarea,div");

        var b = {};
        if (i.attr("type") == "checkbox" || i.attr("type") == "radio") {
            b = i.parent().parent().metadata({
                type: "attr",
                name: "data"
            })
        } else {
            b = i.parent().metadata({
                type: "attr",
                name: "data"
            })
        } if (b.validate != undefined && b.validate.required == true) {
            i = " checked "
        } else {
            i = ""
        }

        var g = c.find("span").metadata({
            type: "attr",
            name: "data"
        });
        d = $(d);
        if (g.validate.minlength != undefined) {
            console.log(d);
            d.find("#form-options-range-min").val(g.validate.minlength);
            d.find("#form-options-range-format").val("characters")
        }
        if (g.validate.maxlength != undefined) {
            d.find("#form-options-range-max").val(g.validate.maxlength);
            d.find("#form-options-range-format").val("characters")
        }
        if (g.validate.minWords != undefined) {
            d.find("#form-options-range-min").val(g.validate.minWords);
            d.find("#form-options-range-format").val("words")
        }
        if (g.validate.maxWords != undefined) {
            d.find("#form-options-range-max").val(g.validate.maxWords);
            d.find("#form-options-range-format").val("words")
        }
        if (g.validate.pattern != undefined) {
            d.find("#form-options-pattern-checkbox").attr("checked", true);
            d.find(".form-options-pattern-more-options").show();

            d.find("#form-options-pattern-pattern").val(g.validate.pattern);
            d.find("#form-options-pattern-message").val(g.validate.messages.pattern)
        }
        if (g.validate.condition != undefined) {
            d.find("#form-options-conditional-checkbox").attr("checked", true);
            d.find(".condition").parent().show();

        }


        if (g.validate.filesize != undefined) {
            d.find("#form-options-filesize").val(Math.round((g.validate.filesize / 1024 / 1024) * 100) / 100)
        }
        if (g.validate.accept != undefined) {
            d.find("#form-options-filetypes").val(g.validate.accept)
        }
        $("#element-options").fadeOut(300, function () {
            $(this).html(d);
            if (i != "" && i != undefined) {
                $("#form-options-checkbox").prop("checked", true);
                $("#form-options-check").append('<label>Error Message</label><input value="' + b.validate.messages.required + '" id="form-options-message">')
            }


            var y = c.find("span");
            var z = y.metadata({
                type: "attr",
                name: "data"
            });

            if (g.validate.conditions != undefined) {

                var w = "";
                var num = z.validate.conditions;

                for (var i = 0; i < num; i++) {
                    var id = i + 1;
                    w = '<div class="condition"><select id="field_rule_field_' + id + '" style="width:100px;" class="field_rule_field" onchange="GetRuleValues(' + id + ',jQuery(this).val());">' + $("#field_rule_field").html() + '</select> ';
                    w += '<select id="field_rule_operator_' + id + '"  style="width:110px;" onchange="SetRuleProperty(' + id + ',\'operator\',jQuery(this).val());"><option value="is" selected="selected">is</option><option value="isnot">is not</option><option value="&gt;">greater than</option><option value="&lt;">less than</option><option value="contains">contains</option><option value="starts_with">starts with</option><option value="ends_with">ends with</option></select> ';
                    w += '<select style="width:120px;" id="field_rule_option_' + id + '" display="none" onchange="SetRuleProperty(' + id + ',\'option\',jQuery(this).val());"></select><input id="field_rule_option_' + id + '"  value="" placeholder="Enter a value" style="display:none;height:15px;width:105px;" onkeyup="SetRuleProperty(' + id + ',\'option\',jQuery(this).val());"/>';
                    w += '<a class="btn mini" id="plus" href=# style="vertical-align:top;"><i class="icon-plus"></i></a> <a class="btn mini" id="minus" href=# style="vertical-align:top;"><i class="icon-minus"></i></a></div>'
                    $(".form-options-conditions").append(w);
                }
            }

            $('#left-column li:eq(1) a').tab('show');
            PopulateFormFieldNames();



            $(this).fadeIn(300)
        });

        var h = c.position();
        $("#left-column").stop(true).animate({
            top: h.top - 20
        }, 800, "swing", function () {
            $("#element-options a.form-tip").tipsy({
                gravity: "w",
                fade: true
            })
        })
    },
    addOption: function (a) {
        return '<div><input type="text" class="form-options-more" value="' + a + '" /> <a tabindex="-1" class="delete-option" href="#"><span class="close-link-span" style="min-height:0px;">delete</span></a></div>'
    },
    textField: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="textField" data="{validate:{required:false,messages:{}},conditions:{}}" ><input type="text" id="{id}" name="{name}" /></span>';
        return main.commonHTML(a, "textField")
    },
    textArea: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="textArea" data="{validate:{required:false,messages:{},conditional:false}}"><textarea id="{id}" name="{name}" ></textarea></span>';
        return main.commonHTML(a, "textArea")
    },
    password: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="password" data="{validate:{required:false,messages:{},conditional:false}}"><input type="password" id="{id}" name="{name}" /></span>';
        return main.commonHTML(a, "password")
    },
    dropDown: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="dropDown" data="{validate:{required:false,messages:{},conditional:false}}"><select id="{id}" name="{name}"><option value="Option 1">Option 1</option><option value="Option 2">Option 2</option><option value="Option 3">Option 3</option></select></span>';
        return main.commonHTML(a, "dropDown")
    },
    radioButton: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="radioButton" data="{validate:{required:false,messages:{},conditional:false}}" id="{id}"><label class="option" for="{id}_option_1"><input class="radio" id="{id}_option_1" type="radio" name="{name}" value="Option 1" />Option 1</label><label class="option" for="{id}_option_2"><input class="radio" id="{id}_option_2" type="radio" name="{name}" value="Option 2" />Option 2</label><label class="option" for="{id}_option_3"><input class="radio" id="{id}_option_3" type="radio" name="{name}" value="Option 3" />Option 3</label></span>';
        return main.commonHTML(a, "radioButton")
    },
    checkBoxGroup: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="checkBoxGroup" data="{validate:{required:false,messages:{},conditional:false}}" id="{id}"><label class="option" for="{id}_option_1"><input class="checkbox" type="checkbox" name="{name}[]" id="{name}_option_1" value="Option 1" />Option 1</label><label class="option" for="{name}_option_2"><input class="checkbox" type="checkbox" name="{name}[]" id="{name}_option_2" value="Option 2" />Option 2</label><label class="option" for="{name}_option_3"><input class="checkbox" type="checkbox" name="{name}[]" id="{name}_option_3" value="Option 3" />Option 3</label></span>';
        return main.commonHTML(a, "checkBoxGroup")
    },
    number: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="number" data="{validate:{required:false,digits:true,messages:{},conditional:false}}"><input type="text" id="{id}" name="{name}" /></span>';
        return main.commonHTML(a, "number")
    },
    email: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="email" data="{validate:{required:false,email:true,messages:{},conditional:false}}"><input type="text" id="{id}" name="{name}" /></span>';
        return main.commonHTML(a, "email")
    },
    url: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="url" data="{validate:{required:false,url:true,messages:{},conditional:false}}"><input type="text" id="{id}" name="{name}" /></span>';
        return main.commonHTML(a, "url")
    },
    date: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="date" data="{validate:{required:false,date:true,messages:{},conditional:false}}"><input type="text" id="{id}" name="{name}" /></span>';
        return main.commonHTML(a, "date")
    },
    time: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="time" data="{validate:{required:false,time:true,messages:{},conditional:false}}"><input type="text" id="{id}" name="{name}" /></span>';
        return main.commonHTML(a, "time")
    },
    phone: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="phone" data="{validate:{required:false,phone:true,messages:{},conditional:false}}"><input type="text" id="{id}" name="{name}" /></span>';
        return main.commonHTML(a, "phone")
    },
    creditCard: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="creditCard" data="{validate:{required:false,creditcard:true,messages:{},conditional:false}}"><input type="text" id="{id}" name="{name}" /></span>';
        return main.commonHTML(a, "creditCard")
    },
    fileUpload: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="fileUpload" data="{fileupload:true,validate:{required:false,accept:&quot;png|jpeg|gif&quot;,filesize: 1048576,messages:{accept:&quot;Please upload only files of type jpeg,png or gif&quot;,filesize:&quot;File size should not exceed 1 MB.&quot;}}}"><input type="file" id="{id}" name="{name}" /></span>';
        return main.commonHTML(a, "fileUpload")
    },
    richText: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="richText" data="{validate:{required:false,messages:{},conditional:false}}"><textarea id="{id}" name="{name}" class="ckeditor"></textarea></span>';
        return main.commonHTML(a, "richText")
    },
    section: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="section" data="{validate:{required:false,messages:{},conditional:false}}"><h1 name="{name}"></h1><div id="{id}" name="{name}"></div></span>';
        return main.commonHTML(a, "section")
    },
    pageBreak: function () {
        var a = '<label class="field" for="{name}">{label}</label><span class="pageBreak" data="{validate:{required:false,messages:{},conditional:false}}"><div id="{id}" name="{name}" class="spacer"></div></span>';
        return main.commonHTML(a, "pageBreak")
    },
    commonHTML: function (b, c) {
        b = '<div class="row">' + b + "</div>";
        var a = $("." + c).length + 1;
        var d = c.toLowerCase() + "_" + a;
        return b.replace(/{id}/g, d).replace(/{name}/g, d).replace(/{label}/g, d)
    },
    lookUp: function (a) {
        switch (a) {
            case "paragraph_text":
                return "textArea";
                break;
            case "in_section":
                return "section";
                break;
            case "page_break":
                return "pageBreak";
                break;
            case "single_line_text":
                return "textField";
                break;
            case "password_text":
                return "password";
                break;
            case "drop_down":
                return "dropDown";
                break;
            case "check_box":
                return "checkBoxGroup";
                break;
            case "radio_buttons":
                return "radioButton";
                break;
            case "in_password":
                return "password";
                break;
            case "in_number":
                return "number";
                break;
            case "in_email":
                return "email";
                break;
            case "in_url":
                return "url";
                break;
            case "in_date":
                return "date";
                break;
            case "in_time":
                return "time";
                break;
            case "in_phone":
                return "phone";
                break;
            case "in_credit_card":
                return "creditCard";
                break;
            case "in_file_upload":
                return "fileUpload";
                break;
            case "rich_text":
                return "richText";
                break;
            default:
                return a;
                break
        }
    },
    reloadElementOptions: function () {
        var f = main.cache;
        var e = f.children("span").attr("class").replace(" required", "");
        var d = "";
        switch (e) {
            case "dropDown":
                $(".form-options-more").each(function () {
                    d += '<option value="' + $(this).val() + '">' + $(this).val() + "</option>"
                });
                f.find("select").html(d);
                break;
            case "radioButton":
                var a = f.find("label").attr("for");
                var c = main.NameToProper(a);
                $(".form-options-more").each(function () {
                    var g = c + "_" + main.NameToProper($(this).val());
                    d += '<label class="option" for="' + g + '"><input class="radio" type="radio" name="' + c + '" id="' + g + '" value="' + $(this).val() + '" />' + $(this).val() + "</label>"
                });
                f.find("span.radioButton").html(d).attr("id", c);
                break;
            case "checkBoxGroup":
                var a = f.find("label").attr("for");
                var c = main.NameToProper(a);
                $(".form-options-more").each(function () {
                    var g = c + "_" + main.NameToProper($(this).val());
                    d += '<label class="option" for="' + g + '"><input class="checkbox" type="checkbox" name="' + c + '[]" id="' + g + '" value="' + $(this).val() + '" />' + $(this).val() + "</label>"
                });
                f.find("span.checkBoxGroup").html(d).attr("id", c);
                break;


            case "fileUpload":
                break;
            default:
                var b = f.find("span").attr(data);
                console.log(b);
                break
        }
    },
    NameToProper: function (a) {
        return a.toLowerCase().replace(/^\s\s*/, "").replace(/\s\s*$/, "").replace(/ /g, "_").replace(/-/g, "_")
    }
};