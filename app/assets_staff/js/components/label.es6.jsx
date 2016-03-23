var Button = ReactBootstrap.Button;
var OverlayTrigger = ReactBootstrap.OverlayTrigger;
var Popover = ReactBootstrap.Popover;

class Post extends React.Component {
    render () {
        return (
            <div>
                <div>Label</div>
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
