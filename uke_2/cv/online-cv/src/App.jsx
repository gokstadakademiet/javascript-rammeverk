import { useState, useEffect } from 'react'
import './App.css'
import SkillsComponent from './components/SkillsComponent'
import { CatFacts } from './components/CatFacts'
import { SearchWithDebounce } from './components/SearchWithDebounce'
import { SimpleForm } from './components/SimpleForm'

export const API_URL = "https://cat-fact.herokuapp.com/facts/"

const App = () => {
  const [catFacts, setCatFacts] = useState([])
  const controller = new AbortController();

  // useEffect(() => {
  //   fetch(`${API_URL}`)
  //     .then(response => response.json())
  //     .then(data => {
  //       setCatFacts(data)
  //     })
  //     .catch(error => console.error(error))

  //     return () => controller.abort()
  //     // clean up function
  // }, [])



  return (
    <div>
      <h1>Min CV App</h1>
      <SkillsComponent /> 
      {/* <CatFacts texts={catFacts.map(fact => fact.text)} /> */}
      <SearchWithDebounce />
      <SimpleForm />
    </div>
  )
}

export default App;