package com.example.backend.controller

import com.example.backend.entity.Todo
import com.example.backend.usecase.CreateTodoUseCase
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController

@RestController
class CreateTodoController(
    private val createTodoUseCase: CreateTodoUseCase
) {
    @PostMapping(value = ["/api/v1/todos"])
    fun createTodoList(
        @RequestBody request: Todo
    ): Unit {
        createTodoUseCase.createTodo(request)
    }
}
