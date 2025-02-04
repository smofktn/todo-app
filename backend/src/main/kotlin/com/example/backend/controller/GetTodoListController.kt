package com.example.backend.controller

import com.example.backend.controller.common.ApiResponseOne
import com.example.backend.usecase.GetTodoListUseCase
import org.springframework.validation.annotation.Validated
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RestController


@RestController
class GetTodoListController(
    private val getTodoListUseCase: GetTodoListUseCase
) {
    @GetMapping(value = ["/api/v1/todos"])
    fun getTodoList(): ApiResponseOne {
        val res = getTodoListUseCase.getTodoList()
        return ApiResponseOne(res)
    }
}
