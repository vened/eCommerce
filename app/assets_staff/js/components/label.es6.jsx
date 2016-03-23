var Button = ReactBootstrap.Button;
var OverlayTrigger = ReactBootstrap.OverlayTrigger;
var Popover = ReactBootstrap.Popover;
var SplitButton = ReactBootstrap.SplitButton;
var MenuItem = ReactBootstrap.MenuItem;

class Post extends React.Component {
    constructor(props){
        super(props)
        console.log(this);
    }


    render () {
        return (
            <div>
                <SplitButton bsStyle='Primary' title='Каталог товаров'>
                    <MenuItem eventKey="1">Action</MenuItem>
                    <MenuItem eventKey="2">Another action</MenuItem>
                    <MenuItem eventKey="3">Something else here</MenuItem>
                    <MenuItem divider/>
                    <MenuItem eventKey="4">Separated link</MenuItem>
                </SplitButton>
                <OverlayTrigger trigger="hover" placement="bottom" overlay={<Popover title="Popover bottom"><strong>Holy guacamole!</strong> Check this info.</Popover>}>
                    <Button bsStyle="default">Hover</Button>
                </OverlayTrigger>
            </div>
        );
    }
}

Post.propTypes = {
    label: React.PropTypes.string
};
