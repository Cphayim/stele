import React, { useEffect, useReducer } from 'react'

import './App.css'
import Header from './Header'
import Movie from './Movie'
import Search from './Search'

const MOVIE_API_URL = 'https://www.omdbapi.com/?s=man&apikey=4a3b711b' // you should replace this with yours

const initialState = {
  loading: true,
  movies: [],
  errorMessage: null
}

const reducer = (state, action) => {
  switch (action.type) {
    case 'SEARCH_MOVIES_RESET':
      return {
        ...state,
        loading: true,
        movies: [],
        errorMessage: null
      }
    case 'SEARCH_MOVIES_SUCCESS':
      return {
        ...state,
        loading: false,
        movies: action.payload
      }
    case 'SEARCH_MOVIES_FAILURE':
      return {
        ...state,
        loading: false,
        errorMessage: action.error
      }
    default:
      return state
  }
}

const App = () => {
  const [state, dispatch] = useReducer(reducer, initialState)

  useEffect(() => {
    fetch(MOVIE_API_URL)
      .then(response => response.json())
      .then(jsonResponse => {
        dispatch({
          type: 'SEARCH_MOVIES_SUCCESS',
          payload: jsonResponse.Search
        })
      })
  }, []) // 空数组代表只在组件被挂载时调用一次，相当于 componentDidMount

  const search = searchValue => {
    dispatch({
      type: 'SEARCH_MOVIES_RESET'
    })

    fetch(`https://www.omdbapi.com/?s=${searchValue}&apikey=4a3b711b`)
      .then(response => response.json())
      .then(jsonResponse => {
        if (jsonResponse.Response === 'True') {
          dispatch({
            type: 'SEARCH_MOVIES_SUCCESS',
            payload: jsonResponse.Search
          })
        } else {
          dispatch({
            type: 'SEARCH_MOVIES_FAILURE',
            error: jsonResponse.Error
          })
        }
      })
  }

  const { movies, errorMessage, loading } = state

  return (
    <div className="App">
      <Header text="HOOKED"></Header>
      <Search search={search}></Search>
      <p className="App-intro">Sharing a few of our favourite movies</p>
      <div className="movies">
        {loading && !errorMessage ? (
          <span>loading...</span>
        ) : errorMessage ? (
          <div className="errorMessage">{errorMessage}</div>
        ) : (
          movies.map((movie, index) => <Movie key={`${index}-${movie.Title}`} movie={movie} />)
        )}
      </div>
    </div>
  )
}

export default App
