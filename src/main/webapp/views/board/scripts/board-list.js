import {Datatable} from "../../../resources/components/datatable/datatable.js";

let page = new URL(window.location.href).searchParams.get('page');
let id = "board"
let products = new Datatable(id, page);

$(document).ready(function() {
    products.init();
    products.header_sort();
    products.row_view();
})
