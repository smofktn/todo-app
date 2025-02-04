package com.example.backend.i_mapper

import com.example.backend.entity.Todo
import org.apache.ibatis.annotations.Mapper

@Mapper
interface TodoMapper {

    fun getTodoList(): List<Todo>
}
