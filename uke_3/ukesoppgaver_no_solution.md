# Oppgavesett: Interaktiv Online CV Webapplikasjon: Debugging & Testing
## Innføring i `Jest` og `Debugging` teknikker

### **Oppgave 1: Basic Logging**

**Mål:** Introduser logging for å spore hendelser i applikasjonen.

**Beskrivelse:**  
Introduser `console.log()`-utsagn i CV-applikasjonen din for å spore verdien av variabler på viktige tidspunkter, for eksempel når brukeren legger til eller sletter en erfaring eller ferdighet. 
 
**Eksempel:** Når en bruker prøver å legge til en ny ferdighet i CV-en sin, logger du tidspunktet og selve ferdigheten for å bekrefte at den blir lagt til som forventet.  

[Se et eksempel her](https://developer.mozilla.org/en-US/docs/Web/API/Console/log)


> [!TIP]
> Bruk `console.log()` strategisk for å spore variabler og hendelser i applikasjonen din. Dette kan hjelpe deg med å forstå flyten og finne feil raskere.


### **Oppgave 2: Jest Grunnleggende - Testing av Funksjoner**

**Mål:** Test funksjoner som hjelper med å formatere data for CV-appen.

**Beskrivelse:**  

Tenk deg at du har en funksjon som formaterer telefonnummeret for CV-en. Den skal sørge for at alle telefonnumre har en bestemt format, for eksempel +47-12345678.  

Skriv en Jest-test for å bekrefte at funksjonen riktig formaterer ulike varianter av telefonnumre til ønsket format.  

[Link: Telefonnummer formatering med Jest](https://jestjs.io/docs/getting-started)



> [!IMPORTANT]
> Testing av funksjoner er avgjørende for å sikre at applikasjonen din fungerer som forventet og for å unngå feil i produksjon.

### **Oppgave 3: Testing av Data Manipulering**

**Mål:** Test funksjoner som legger til eller fjerner ferdigheter fra CV-en.

**Beskrivelse:**  

I CV-appen kan brukere legge til ferdigheter. Tenk deg at du har en funksjon som tar en ferdighet og legger den til en liste.  

Skriv en Jest-test for å sjekke at når en ferdighet legges til, er den faktisk lagt til i listen. Du bør også teste hva som skjer hvis brukeren prøver å legge til en tom ferdighet eller en ferdighet som allerede er på listen.  

[Link: Teste arrays og iterables med Jest](https://jestjs.io/docs/tutorial-async)


> [!TIP]
> Test både positive og negative tilfeller for å sikre at funksjonen din håndterer alle mulige scenarier.

### **Oppgave 4: Testing av UI-komponenter med Jest**

**Mål:** Bli kjent med hvordan du kan bruke Jest for å teste interaktive aspekter av CV-appen.

**Beskrivelse:**  

Tenk deg at du har en knapp i CV-appen som, når den blir klikket, åpner et vindu eller en modal der brukere kan redigere sin erfaring.  
Skriv en Jest-test som simulerer et klikk på denne knappen og bekrefter at redigeringsvinduet faktisk åpnes.  

[Link: Simuler events med Jest og @testing-library/react](https://testing-library.com/docs/dom-testing-library/api-events/)


> [!IMPORTANT]
> Testing av UI-komponenter sikrer at brukergrensesnittet ditt fungerer som forventet og gir en god brukeropplevelse.

### **Oppgave 5: Feilsøking av Kode**

**Mål:** Lær å identifisere og rette feil i koden.

**Beskrivelse:**  
I denne oppgaven skal du finne og rette en feil i en gitt kode. Koden nedenfor er ment å legge til et element i en handleliste, men det er en feil som hindrer den fra å fungere som forventet. Finn feilen og rett den.

**Kode som skal feilsøkes:**

```javascript
// shoppingList.js
const addItem = (list, item) => {
  if (item || !list.includes(item)) {
    list.push(item);
  }
  return list;
}
```


**Jest Tester**

For å sikre at koden fungerer som forventet etter rettingen, kan du bruke følgende Jest tester:

```javascript
// shoppingList.test.js
test('adds a new item to the list', () => {
  const list = ['apple', 'banana'];
  const result = addItem(list, 'orange');
  expect(result).toEqual(['apple', 'banana', 'orange']);
});

test('does not add an existing item to the list', () => {
  const list = ['apple', 'banana'];
  const result = addItem(list, 'banana');
  expect(result).toEqual(['apple', 'banana']);
});

test('does not add an empty item to the list', () => {
  const list = ['apple', 'banana'];
  const result = addItem(list, '');
  expect(result).toEqual(['apple', 'banana']);
});

test('does not add a null item to the list', () => {
  const list = ['apple', 'banana'];
  const result = addItem(list, null);
  expect(result).toEqual(['apple', 'banana']);
});
```



### **Oppgave 6: Snapshot Testing**
**Mål:** Forstå grunnprinsippene for snapshot testing og hvordan det kan brukes for å sikre at UI ikke endres utilsiktet.

**Beskrivelse:**  

I CV-appen, tenk deg at du har en komponent som viser brukerens utdanningshistorikk. Vi skal skrive en Jest snapshot-test for denne komponenten for å sikre at den ikke endres utilsiktet i fremtidige oppdateringer av koden.  

[Link: Snapshot Testing med Jest](https://jestjs.io/docs/snapshot-testing)


> [!TIP]
> Du kan også bruke `npm test -- --watch` for å kjøre testene kontinuerlig mens du utvikler.

#### **Hvorfor er snapshot testing nyttig?**

Snapshot testing er nyttig fordi det lar oss fange utilsiktede endringer i UI-komponenter. Hvis noen endrer `EducationHistory`-komponenten i fremtiden, vil snapshot-testen feile hvis den nye outputen ikke matcher den lagrede snapshoten. Dette gir oss en mulighet til å gjennomgå endringene og bekrefte at de er forventet.

#### **Oppsummering**

Med snapshot testing kan vi sikre at komponentens output ikke endres utilsiktet over tid. Dette er spesielt nyttig i store prosjekter hvor mange utviklere jobber på samme kodebase, da det hjelper med å opprettholde konsistens i UI-komponentene.



## Innføring i `PropTypes` & `TypeScript`

### **Oppgave 1: Intro til PropTypes**

**Mål:** Bli kjent med PropTypes for typechecking før vi dykker dypere inn i TypeScript.

**Beskrivelse:**  
Opprett en React-komponent `Profile` som viser grunnleggende brukerinformasjon. Bruk PropTypes for å sikre at `Profile` tar inn følgende props:
- `name`: en streng
- `age`: et nummer
- `experience`: en array av objekter, hvor hvert objekt har en `title` (streng) og `years` (nummer).

**Link:** [PropTypes documentation](https://reactjs.org/docs/typechecking-with-proptypes.html)


[React PropTypes and type checking](https://reactjs.org/docs/typechecking-with-proptypes.html)  
[PropTypes on GitHub](https://github.com/facebook/prop-types)

### **Oppgave 2: Integrering av TypeScript i et eksisterende React-prosjekt**

**Mål:** Integrer TypeScript i et eksisterende React JS-prosjekt for CV-applikasjonen.

**Beskrivelse:**  
Ta et eksisterende React JS-prosjekt for CV-applikasjonen og integrer TypeScript. Dette innebærer å installere nødvendige avhengigheter, konfigurere tsconfig, og endre noen av de eksisterende React JS-komponentene til TypeScript-komponenter.

**Link:** [Adding TypeScript to an Existing Project](https://www.typescriptlang.org/docs/handbook/migrating-from-javascript.html)


[Adding TypeScript to an Existing Project](https://www.typescriptlang.org/docs/handbook/migrating-from-javascript.html)  
[TypeScript and React](https://fettblog.eu/typescript-react/)

### **Oppgave 3: Feilsøking i React-komponenter**

**Mål:** Forbedre feilsøkingsferdigheter ved å identifisere og rette feil i React-komponenter.

**Beskrivelse:**  
I denne oppgaven skal du finne og rette feil i en gitt React-komponent. Koden nedenfor er ment å vise en liste over brukere med navn og alder, men den inneholder en feil som forhindrer riktig visning. Din oppgave er å finne og rette feilen.

**Link:** [React Documentation](https://reactjs.org/docs/getting-started.html)

**Kode:**

```javascript
import React from 'react';
import PropTypes from 'prop-types';

const UserList = ({ users }) => {
  return (
    <div>
      <h1>User List</h1>
      <ul>
        {users.map(user => (
          <li key={user.id}>
            {user.name} - {user.age} years old
          </li>
        ))}
      </ul>
    </div>
  );
};

UserList.propTypes = {
  users: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.number.isRequired,
      name: PropTypes.string.isRequired,
      age: PropTypes.number.isRequired,
    })
  ).isRequired,
};

export default UserList;
```

**Initial list of users with errors:**

```javascript
const users = [
  { id: "1", name: 'Alice', age: 25 }, // Incorrect type for id
  { id: "2", name: 'Bob' }, // Missing age prop and incorrect type for id
  { id: "3", name: 'Charlie', age: 'thirty' } // Incorrect type for age and id
];
```







### **Oppgave 4: Feilsøking i TypeScript**

**Mål:** Lære å identifisere og rette opp feil i TypeScript-kode.

**Beskrivelse:**  
I denne oppgaven skal du feilsøke en `Profile`-komponent som er skrevet i TypeScript. Koden har en feil som forhindrer den fra å fungere som forventet. Din oppgave er å finne og rette opp feilen. Koden skal vise brukerens navn, alder og arbeidserfaring.

**Link:** [TypeScript Error Handling](https://www.typescriptlang.org/docs/handbook/basic-types.html)

> [!NOTE]  
> Hvis du ønsker å teste dette loktalt, er det viktig at filen har endingen `.tsx`, og ikke `.jsx`.

Her er koden for `Profile`-komponenten:

  ```typescript
  import React, { FC } from 'react';

  interface ProfileProps {
    name: string;
    age: number;
    experience: {
      title: string;
      years: number;
    }[];
  }

  const Profile: FC<ProfileProps> = ({ name, age, experience }) => {
    return (
      <div>
        <h1>{name}</h1>
        <p>Age: {age}</p>
        <ul>
          {experience.map((exp, index) => (
            <li key={index}>
              {exp.title} - {exp.years} years
            </li>
          ))}
        </ul>
      </div>
    );
  };

  export default Profile;

  // Usage example with incorrect props
  const App = () => {
    return (
      <Profile
        name="John Doe"
        age="30" // Error: age should be a number
        experience={[
          { title: "Developer", years: "5" }, // Error: years should be a number
          { title: "Manager", years: 3 }
        ]}
      />
    );
  };

  export default App;
  ```
  



### **Oppgave 5: Bruk av Type Assertions**
**Mål:** Forstå hvordan og når du skal bruke type assertions i TypeScript.

**Beskrivelse:**  
I CV-applikasjonen, opprett en hjelpefunksjon `parseUserData` som tar en streng (JSON format) og konverterer den til et objekt. Bruk type assertions for å forsikre TypeScript at den returnerte verdien er av en spesifikk type (f.eks. `UserProfile` type).

Bruk for eksempel følgende grensesnitt og JSON streng:

```typescript
interface UserProfile {
       name: string;
       age: number;
       experience: { title: string; years: number }[];
    }
```

`'{"name":"John Doe","age":30,"experience":[{"title":"Developer","years":5},{"title":"Manager","years":3}]}'`

**Link:** [TypeScript Type Assertions](https://www.typescriptlang.org/docs/handbook/basic-types.html#type-assertions)


[TypeScript Type Assertions](https://www.typescriptlang.org/docs/handbook/basic-types.html#type-assertions)  
[Assert function argument is a certain type in TypeScript](https://stackoverflow.com/questions/40081332/assert-function-argument-is-a-certain-type-in-typescript)

### **Oppgave 6: Union Typer og Literal Typer**

**Mål:** Utforske hvordan union typer og literal typer kan være nyttige i CV-applikasjonen.

**Beskrivelse:**  
Lag en komponent `Filter` i CV-applikasjonen som lar brukere filtrere jobberfaring basert på jobbtittel eller årstall. Denne komponenten skal ha en prop som bestemmer hvilken type filter den skal bruke. Bruk union typer for å definere denne propen som enten en streng (jobbtittel) eller et nummer (årstall). Bruk også literal typer for å sikre at den aksepterte strengen er en av forhåndsdefinerte jobbtitler.

**Link:** [TypeScript Union and Literal Types](https://www.typescriptlang.org/docs/handbook/unions-and-intersections.html)


[TypeScript Union and Literal Types](https://www.typescriptlang.org/docs/handbook/unions-and-intersections.html)  
[Practical TypeScript: Union and Intersection Types](https://dzone.com/articles/practical-typescript-union-and-intersection-types)

### **Oppgave 7: Generiske Typer**

**Mål:** Utforske dypere bruken av generiske typer i TypeScript.

**Beskrivelse:**  
Lag en generisk funksjon `getDetails` som tar en array av objekter og en nøkkel som en streng. Denne funksjonen skal returnere en ny array med verdiene tilhørende den nøkkelen fra hvert objekt. For eksempel, hvis den mottar en array av jobberfaringer og nøkkelen 'jobTitle', skal den returnere en array av jobbtitlene.

**Link:** [TypeScript Handbook: Generics](https://www.typescriptlang.org/docs/handbook/generics.html)


[TypeScript Handbook: Generics](https://www.typescriptlang.org/docs/handbook/generics.html)  
[Understanding TypeScript Generics](https://www.tutorialsteacher.com/typescript/typescript-generics)


