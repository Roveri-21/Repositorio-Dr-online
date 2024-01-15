let airport = 'AA'

switch (airport){
    case 'Mco':
        console.log('Orlando')
        break
    case 'JFK':
        console.log('john F.')
        break
    case 'SEA':
        console.log('seattle')
        break
    default:
        console.log('não conhecido')
        break
}

// funciona quase como o case do mysql a unica diferença e que o mesmo vai realizar o break assim que entrar em um dos casos

// caso ele não entre em nenhuma condição ele vai para o default funcionandi como o else
