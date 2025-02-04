package com.example.backend.controller.common

import com.example.backend.entity.Todo

class ApiResponseOne(
    var response: List<Todo>? = mutableListOf(), //TODO:将来的には様々な型を許容
) {
    fun ApiResponseOne(response: List<Todo>) {
        this.response = response
    }
}
