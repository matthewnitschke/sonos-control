import { createStore } from 'redux';

const Actions = {
    LOAD
};

const Reducer = (state = {}, action) => {
    switch(action.type) {
        case Actions.LOAD:
            return Object.assign({}, state, {});
            break;
        default:
            state;
    }
    return state;
}

const Store = createStore(Reducer);