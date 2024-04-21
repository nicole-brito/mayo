// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

var inputElement = document.querySelector('input[name="article[tag_list]"]');
var tags = JSON.parse(inputElement.dataset.tags);

var tagify = new Tagify(inputElement, {
    delimiters: null,
    templates: {
        tag: function (tagData) {
            try {
                return `<tag title='${tagData.value}' contenteditable='false' spellcheck="false" class='tagify__tag ${tagData.class ? tagData.class : ""}' ${this.getAttributes(tagData)}>
                        <x title='remove tag' class='tagify__tag__removeBtn'></x>
                        <div>
                            <span class='tagify__tag-text'>${tagData.value}</span>
                        </div>
                    </tag>`
            } catch (err) {
            }
        },

        dropdownItem: function (tagData) {
            try {
                return `<div ${this.getAttributes(tagData)} class='tagify__dropdown__item ${tagData.class ? tagData.class : ""}' >
                            <span>${tagData.value}</span>
                        </div>`
            } catch (err) {
                console.error(err)
            }
        }
    },
    enforceWhitelist: true,
    whitelist: tags,
    dropdown: {
        enabled: 1, // suggest tags after a single character input
        classname: 'extra-properties' // custom class for the suggestions dropdown
    } // map tags' values to this property name, so this property will be the actual value and not the printed value on the screen
})

tagify.on('click', function (e) {
    updateOriginalInput();
    //console.log(e.detail);
});

tagify.on('remove', function (e) {
    updateOriginalInput();
    //console.log(e.detail);
});

tagify.on('add', function (e) {
    console.log("original Input:", tagify.DOM.originalInput);
    console.log("original Input's value:", tagify.DOM.originalInput.value);
    console.log("event detail:", e.detail);
});

// add the first 2 tags and makes them readonly
var tagsToAdd = tagify.whitelist.slice(0, 4)
tagify.addTags(tagsToAdd)

function updateOriginalInput() {
    var tags = tagify.value.map(function(tagData) {
        return tagData.value;
    });
    tagify.DOM.originalInput.value = tags.join(',');
}