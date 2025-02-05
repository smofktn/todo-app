<script setup lang="ts">
import { defineProps, defineEmits } from "vue";
import axios from "axios";
import type { Todo } from "@/types/todo";

const props = defineProps<{
  todos: Todo[];
}>();

const emit = defineEmits(["update"]);

const toggleDone = async (todo: Todo) => {
  await axios.patch(`/api/todos/${todo.id}`, { is_done: !todo.isDone });
  emit("update");
};

const deleteTodo = async (id: number) => {
  await axios.delete(`/api/todos/${id}`);
  emit("update");
};
</script>

<template>
  <ul>
    <li v-for="todo in todos" :key="todo.id">
      <span :class="{ done: todo.isDone }"
        >{{ todo.title }} - {{ todo.deadline || "No deadline" }}</span
      >
      <button @click="deleteTodo(todo.id)">Delete</button>
    </li>
  </ul>
</template>

<style scoped>
.done {
  text-decoration: line-through;
}
</style>
