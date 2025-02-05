<script setup lang="ts">
import { onMounted, ref } from "vue";
import apiClient from "./http-common";
import ApiService from "./services/ApiService";
import type { Todo } from "./types/todo";

const list: Todo[] = [
  {
    id: 1,
    title: "サンプル",
    isDone: false,
  },
  {
    id: 2,
    title: "サンプル",
    isDone: false,
  },
];

const inputValue = ref("");

const onClickDelete = (id: number) => {
  console.log("onClickDelete:", id);
  deleteTodo(id);
};

const onClickAdd = () => {
  console.log("onClickAdd:", inputValue.value);
  const requestTodo: Todo = {
    id: 0, //NOTE:仮の値
    title: inputValue.value,
  };
  createTodo(requestTodo);
  inputValue.value = "";
};

const getList = async () => {
  console.log("getList");
  console.log("listに詰める");
  await ApiService.getAll();
};
const deleteTodo = async (id: number) => {
  await ApiService.delete(id);
  await getList();
};

const createTodo = async (data: Todo) => {
  await ApiService.create(data);
  await getList();
};

onMounted(getList);
</script>

<template>
  <div class="input-section">
    <input v-model="inputValue" class="task-input" type="text" />
    <button class="button" @click="onClickAdd">追加</button>
  </div>
  <div class="main-section">
    <div v-for="item in list" class="task-item">
      <div class="task-title-box">
        <span class="task-title">{{ item.title }}</span>
      </div>
      <div class="task-item-button-box">
        <button class="button" @click="onClickDelete(item.id)">削除</button>
      </div>
    </div>
  </div>
</template>

<style scoped>
.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}

.input-section {
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.main-section {
  height: calc(100% - 50px);
  width: 100%;
  padding: 24px;
}

.task-input {
  width: 80%;
  max-width: 300px;
  height: 40px;
  border-radius: 8px;
  padding: 0px;
  padding-left: 8px;
  margin-right: 8px;
  background-color: #fcfcfc;
}
.button {
  height: 40px;
  display: flex;
  align-items: center;
}

.list-section {
  overflow: auto;
  height: 100%;
  width: 100%;
}
.task-item {
  height: 50px;
  width: 100%;
  display: flex;
}
.task-title {
  color: #333333;
}
.task-title-box {
  width: 80%;
  height: 100%;
  padding: 0 16px;
}
.task-item-button-box {
  width: 20%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
