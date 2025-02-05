package com.example.backend.controller

import com.example.backend.usecase.DeleteTodoUseCase
import org.springframework.web.bind.annotation.*

@RestController
class DeleteTodoController(
    private val deleteTodoUseCase: DeleteTodoUseCase
) {
    @DeleteMapping(value = ["/api/v1/todos/{id}"])
    fun createTodoList(
        @PathVariable("id") id: Long,
    ): Unit {
        deleteTodoUseCase.deleteTodoList(id)
    }
}
