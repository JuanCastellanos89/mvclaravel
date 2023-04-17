@extends('dashboard.master')
@section('titulo', 'Actualizar Category')
@section('contenido')
@include('dashboard.partials.validation-error')
  <h2 class="text-xl">Actualizar Categoria</h2>
  <form action="{{ route('category.update', $category->id) }}" method="post">
    @method('PUT')
    @include('dashboard.category._form')
  </form>
@endsection