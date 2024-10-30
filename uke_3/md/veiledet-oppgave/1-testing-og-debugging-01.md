## Innføring i `Jest` og `Debugging` teknikker

### **Oppgave 1: Basic Logging**

**Mål:** Introduser logging for å spore hendelser i applikasjonen.

**Beskrivelse:**  
Introduser `console.log()`-utsagn i CV-applikasjonen din for å spore verdien av variabler på viktige tidspunkter, for eksempel når brukeren legger til eller sletter en erfaring eller ferdighet.  
**Eksempel:** Når en bruker prøver å legge til en ny ferdighet i CV-en sin, logger du tidspunktet og selve ferdigheten for å bekrefte at den blir lagt til som forventet.  
[Se et eksempel her](https://developer.mozilla.org/en-US/docs/Web/API/Console/log)

<details><summary>Løsning</summary>

For å introdusere logging, kan du bruke `console.log()` på strategiske steder i koden:


```javascript
const addSkill = (skill) => {
  console.log('Adding skill at:', new Date());
  console.log('Skill:', skill);
  // Resten av koden som legger til ferdigheten
}
```

**Forklaring:** 
Ved å logge tidspunktet og ferdigheten, kan vi bekrefte at ferdigheten blir lagt til som forventet.

</details>

> [!TIP]
> Bruk `console.log()` strategisk for å spore variabler og hendelser i applikasjonen din. Dette kan hjelpe deg med å forstå flyten og finne feil raskere.


### **Oppgave 2: Jest Grunnleggende - Testing av Funksjoner**

**Mål:** Test funksjoner som hjelper med å formatere data for CV-appen.

**Beskrivelse:**  
Tenk deg at du har en funksjon som formaterer telefonnummeret for CV-en. Den skal sørge for at alle telefonnumre har en bestemt format, for eksempel +47-12345678.  
Skriv en Jest-test for å bekrefte at funksjonen riktig formaterer ulike varianter av telefonnumre til ønsket format.  
[Link: Telefonnummer formatering med Jest](https://jestjs.io/docs/getting-started)


<details><summary>Løsning</summary>

**Steg 1: Definer funksjonen som skal testes**

```javascript
// formatPhone.js
const formatPhone = (phone) => {
  // Formatering logikk
}
```


**Forklaring:** 
Denne funksjonen skal ta et telefonnummer som input og returnere det i ønsket format.

**Steg 2: Skriv en Jest-test for funksjonen**

```javascript
// formatPhone.test.js
test('formats phone numbers correctly', () => {
  expect(formatPhone('12345678')).toBe('+47-12345678');
  // ... flere tester
});
```


**Forklaring:** 
Med Jest, kan vi enkelt skrive tester for funksjoner som `formatPhone` for å sikre at de virker som forventet.

</details>

> [!IMPORTANT]
> Testing av funksjoner er avgjørende for å sikre at applikasjonen din fungerer som forventet og for å unngå feil i produksjon.

### **Oppgave 3: Testing av Data Manipulering**

**Mål:** Test funksjoner som legger til eller fjerner ferdigheter fra CV-en.

**Beskrivelse:**  
I CV-appen kan brukere legge til ferdigheter. Tenk deg at du har en funksjon som tar en ferdighet og legger den til en liste.  
Skriv en Jest-test for å sjekke at når en ferdighet legges til, er den faktisk lagt til i listen. Du bør også teste hva som skjer hvis brukeren prøver å legge til en tom ferdighet eller en ferdighet som allerede er på listen.  
[Link: Teste arrays og iterables med Jest](https://jestjs.io/docs/tutorial-async)

<details><summary>Løsning</summary>

**Steg 1: Opprett funksjonen som skal testes**

```javascript
// skills.js
const addSkill = (skills, skill) => {
  if (skill && !skills.includes(skill)) {
    skills.push(skill);
  }
  return skills;
}
```

**Forklaring:** 
Denne funksjonen tar en liste av ferdigheter og en ny ferdighet som input, og legger til den nye ferdigheten i listen hvis den ikke allerede finnes der.

**Steg 2: Skriv en Jest-test for funksjonen**

```javascript
// skills.test.js
test('adds a skill to the list', () => {
  const skills = ['JavaScript'];
  const updatedSkills = addSkill(skills, 'React');
  expect(updatedSkills).toContain('React');
});
```

**Forklaring:** 
Med Jest, kan vi skrive tester for funksjoner som legger til eller fjerner ferdigheter fra en liste for å sikre korrekt funksjonalitet.

</details>

> [!TIP]
> Test både positive og negative tilfeller for å sikre at funksjonen din håndterer alle mulige scenarier.

### **Oppgave 4: Testing av UI-komponenter med Jest**

**Mål:** Bli kjent med hvordan du kan bruke Jest for å teste interaktive aspekter av CV-appen.

**Beskrivelse:**  
Tenk deg at du har en knapp i CV-appen som, når den blir klikket, åpner et vindu eller en modal der brukere kan redigere sin erfaring.  
Skriv en Jest-test som simulerer et klikk på denne knappen og bekrefter at redigeringsvinduet faktisk åpnes.  
[Link: Simuler events med Jest og @testing-library/react](https://testing-library.com/docs/dom-testing-library/api-events/)

<details><summary>Løsning</summary>

**Steg 1: Opprett komponenten som skal testes**

```javascript
// EditButton.js
import React, { useState } from 'react';

const EditButton = () => {
  const [isOpen, setIsOpen] = useState(false);

  const handleClick = () => {
    setIsOpen(true);
  };

  return (
    <div>
      <button onClick={handleClick}>Edit</button>
      {isOpen && <div>Edit Window</div>}
    </div>
  );
};

export default EditButton;
```

**Forklaring:** 
Denne komponenten viser en knapp som, når den blir klikket, åpner et redigeringsvindu.

**Steg 2: Skriv en Jest-test for komponenten**

```javascript
// EditButton.test.js
import { render, fireEvent } from '@testing-library/react';
import EditButton from './EditButton';

test('opens edit window on click', () => {
  const { getByText } = render(<EditButton />);
  fireEvent.click(getByText('Edit'));
  expect(getByText('Edit Window')).toBeInTheDocument();
});
```

**Forklaring:** 
Med kombinasjonen av Jest og `@testing-library/react`, kan vi simulere brukerinteraksjoner og teste UI-komponenter.

</details>

> [!IMPORTANT]
> Testing av UI-komponenter sikrer at brukergrensesnittet ditt fungerer som forventet og gir en god brukeropplevelse.

### **Oppgave 5: Feilsøking av Kode**

**Mål:** Lær å identifisere og rette feil i koden.

**Beskrivelse:**  
I denne oppgaven skal du finne og rette en feil i en gitt kode. Koden nedenfor er ment å legge til en ferdighet i en liste, men det er en feil som hindrer den fra å fungere som forventet. Finn feilen og rett den.

**Kode som skal feilsøkes:**

```javascript
// skills.js
const addSkill = (skills, skill) => {
  if (skill || !skills.includes(skill)) {
    skills.push(skill);
  }
  return skills;
}
```

<details><summary>Løsning</summary>

**Løsning:** 
Feilen ligger i betingelsen `if (skill || !skills.includes(skill))`. Den skal bruke en logisk OG (`&&`) i stedet for en logisk ELLER (`||`).

**Rettet kode:**

```javascript
// skills.js
const addSkill = (skills, skill) => {
  if (skill && !skills.includes(skill)) {
    skills.push(skill);
  }
  return skills;
}
```

**Forklaring:** 
Ved å bruke `&&` i stedet for `||`, sikrer vi at ferdigheten kun legges til hvis den ikke er tom og ikke allerede finnes i listen.

</details>
