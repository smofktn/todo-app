<script setup lang="ts">
import { ref, onMounted } from "vue";
import axios from "axios";
import TodoForm from "@/components/TodoForm.vue";
import TodoList from "@/components/TodoList.vue";
import type { Todo } from "@/types/todo";

const todos = ref<Todo[]>([]);

const fetchTodos = async () => {
  const response = await axios.get<Todo[]>("/api/todos"); //TODO:responseの型 AxiosResponse<Todo[], any> anyやめる
  todos.value = response.data;
};

onMounted(fetchTodos);
</script>

<template>
  <div id="app">
    <h1>ToDo App</h1>
    <TodoForm @todo-added="fetchTodos" />
    <TodoList :todos="todos" @update="fetchTodos" />
  </div>
</template>
