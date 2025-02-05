package com.example.backend.controller

import com.example.backend.entity.Todo
import com.example.backend.usecase.GetTodoListUseCase
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController


@RestController
class GetTodoListController(
    private val getTodoListUseCase: GetTodoListUseCase
) {
    @GetMapping(value = ["/api/v1/todos"])
    fun getTodoList(): List<Todo> {
        return getTodoListUseCase.getTodoList()
    }
}
